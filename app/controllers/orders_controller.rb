#encoding: utf-8

require "id_factory"

class OrdersController < ApplicationController
  before_filter :authenticate_user!

  include OrdersHelper

  def index
    @orders = current_user.orders
  end

  def new
    @course = Course.find(params[:course_id])
    @campaigns = @course.active_campaigns

    @already_exists = is_order_exists?(@campaigns.collect{|c| c.id})

    if @already_exists
      flash[:alert] = t('errors.messages.course_registered')
    end

    @order = Order.new({:user => current_user,
                        :total_amount => @course.discount_price})
  end

  def create
    @course = Course.find(params[:course_id])
    @campaigns = @course.active_campaigns

    @campaign = Campaign.find(params[:selected_campaign])

    @order = Order.new({:user => current_user,
                        :total_amount => @course.discount_price})

    if is_order_exists?(@campaign.id)
      flash[:alert] = 'you have register already.'
      render 'new'
      return
    end

    @order.status = '未付款'
    @order.order_code = IdFactory.next_num(:order_id)
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


end
