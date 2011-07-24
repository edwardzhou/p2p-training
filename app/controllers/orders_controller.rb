#encoding: utf-8

require "id_factory"

class OrdersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def new
    @course = Course.find(params[:course_id])
    @campaigns = @course.active_campaigns

    @order = Order.new({:user => current_user,
                        :total_amount => @course.discount_price})
  end

  def create
    @course = Course.find(params[:course_id])
    @campaigns = @course.active_campaigns
    @order = Order.new({:user => current_user,
                        :total_amount => @course.discount_price})
    @order.status = '未付款'
    @order.order_code = IdFactory.next_num(:order_id)
    @order_item = @order.order_items.build
    @order_item.campaign = Campaign.find(params[:selected_campaign])
    @order_item.price = @course.price
    @order_item.discount_price = @course.discount_price
    @order_item.qty = 1
    @order_item.calc
    @order.calc

    @order.save

    redirect_to orders_path
  end


end
