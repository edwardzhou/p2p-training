#encoding: utf-8

require "id_factory"

class OrdersController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource
  skip_authorization_check :only => [:index, :new, :create]

  include OrdersHelper

  def index
    orders = current_user.orders.scoped

    @orders = case params[:s]
               when 'all' then
                 orders
               when 'cancel' then
                 orders.cancelled
               when 'finish' then
                 orders.finished
               else
                 orders.active
             end

  end

  def new
    @campaign = Campaign.find(params[:campaign_id])

    @already_exists = is_order_exists?([@campaign.id])

    if @already_exists
      flash[:alert] = t('errors.messages.course_registered')
    end

    @order = Order.new({:user => current_user,
                        :campaign => @campaign,
                        :total_amount => @campaign.discount_price})
  end

  def edit
    #@order = Order.find(params[:id])
    @campaign = @order.campaign
    @course = @campaign.course
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])

    @already_exists = is_order_exists?([@campaign.id])

    if @already_exists
      flash[:alert] = t('errors.messages.course_registered')
      redirect_to ({:action => "index"})
      return
    end

    @order = Order.new({:user => current_user,
                        :total_amount => @campaign.discount_price})
    #@order.attributes.merge!(params[:order])
    coupon_code = params[:order].delete('coupon_code')
    @order.attributes = params[:order]


    @order.status = Order::Status::PENDING_PAYMENT
    @order.order_code = IdFactory.next_num(:order_id)
    @order.campaign = @campaign
    @order_item = @order.order_items.build
    @order_item.campaign = @campaign
    @order_item.price = @campaign.price
    @order_item.discount_price = @campaign.discount_price

    unless coupon_code.blank?
      coupon = Coupon.find_by_coupon_code(coupon_code)
      result = internal_check_coupon(@campaign, coupon)
      if result["result"] == 0
        coupon.decrease_qty
        @order_item.discount_price = result["new_price"]
        @order.coupon = coupon
        if @order_item.discount_price == 0
          @order.status = Order::Status::PAID
        end
      end
    end

    @order_item.qty = 1
    @order_item.calc
    @order.calc

    @order.save

    NotificationMailer.notify_order_created(@order).deliver

    if @order.status != Order::Status::PAID
      redirect_to confirm_payment_order_path(@order)
    else
      redirect_to orders_path
    end
  end

  def update
    @order.comment = params[:order][:comment]
    @order.save
    @campaign = @order.campaign

    NotificationMailer.notify_order_updated(@order).deliver

    redirect_to confirm_payment_order_path(@order)
  end

  def confirm_payment
    @order = Order.find(params[:id])

  end

  def pay
    @order = Order.find(params[:id])

  end

  def cancel
    @order = Order.find(params[:id])
    @order.reason = params[:confirm_reason]
    @order.status = Order::Status::CANCELLED
    @order.save

    NotificationMailer.notify_order_cancelled(@order).deliver

    redirect_to orders_path, :notice => "课程订单[#{@order.order_code}]取消成功!"
  end

  def apply_to_refund
    @order = Order.find(params[:id])
    @order.reason = params[:confirm_reason]
    @order.status = Order::Status::PENDING_REFUND
    @order.save
    redirect_to orders_path, :notice => "课程订单[#{@order.order_code}]退款申请已成功提交! 请等待处理通知。"
  end

  def verify_coupon
    @campaign = Campaign.find(params[:campaign_id])
    @coupon = Coupon.find_by_coupon_code(params[:coupon_code])
    result = internal_check_coupon(@campaign, @coupon)

    respond_to do |format|
      format.json {render :json => result.to_json}
    end

  end

  def internal_check_coupon(campaign, coupon)
    result = {}
    result["new_price"] = campaign.discount_price
    if coupon.nil?
      # cannot found
      result["result"] = -1
      result["msg"] = "无效优惠卷代码!"
    elsif ((!coupon.campaign.nil?) and (coupon.campaign_id != campaign.id)) or
          ((!coupon.course.nil?) and (coupon.course_id != campaign.course_id))
      # not match
      result["result"] = -2
      result["msg"] = "该优惠卷不适用于本课程!"
    elsif coupon.disabled?
      result["result"] = -3
      result["msg"] = "该优惠卷已失效!"
    elsif coupon.qty < 1
      # coupon used
      result["result"] = -4
      result["msg"] = "该优惠卷已被使用!"
    else
      # valid coupon
      result["result"] = 0
      if coupon.discount_type == Coupon::Type::BY_RATE
        new_price = (campaign.discount_price * coupon.discount_rate / 100.0).round
        result["msg"] = "优惠卷有效，优惠折扣 #{coupon.discount_rate}%. #{format("￥%.2f",campaign.discount_price)} x #{coupon.discount_rate}% = #{format('￥%.2f', new_price)}。"
        result["new_price"] = new_price
      else
        new_price = coupon.discount_price
        result["msg"] = "优惠卷有效, 直接优惠价 #{format('￥%.2f', new_price)}。"
        result["new_price"] = new_price
      end
    end

    result
  end

end
