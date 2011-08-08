#encoding: utf-8

require "id_factory"

class OrdersController < ApplicationController
  before_filter :authenticate_user!

  include OrdersHelper

  def index
    status = case params[:s]
               when 'all' then
                 []
               when 'cancel' then
                 [Order::Status::CANCELLED]
               when 'finish' then
                 [Order::Status::PAID, Order::Status::REFUNDED]
               else
                 [Order::Status::PENDING_PAYMENT, Order::Status::PENDING_REFUND]
             end
    if status.size > 0
      @orders = current_user.orders.where(:status => status)
    else
      @orders = current_user.orders
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

  def create
    @campaign = Campaign.find(params[:campaign_id])

    @order = Order.new({:user => current_user,
                        :total_amount => @campaign.discount_price})
    #@order.attributes.merge!(params[:order])
    @order.attributes = params[:order]

    @order.status = Order::Status::PENDING_PAYMENT
    @order.order_code = IdFactory.next_num(:order_id)
    @order.campaign = @campaign
    @order_item = @order.order_items.build
    @order_item.campaign = @campaign
    @order_item.price = @campaign.price
    @order_item.discount_price = @campaign.discount_price
    @order_item.qty = 1
    @order_item.calc
    @order.calc

    @order.save

    redirect_to orders_path
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
    redirect_to orders_path, :notice => "订单[#{@order.order_code}]取消成功!"
  end

  def apply_to_refund
    @order = Order.find(params[:id])
    @order.reason = params[:confirm_reason]
    @order.status = Order::Status::PENDING_REFUND
    @order.save
    redirect_to orders_path, :notice => "订单[#{@order.order_code}]退款申请已成功提交! 请等待处理通知。"
  end

end
