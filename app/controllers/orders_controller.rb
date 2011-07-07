class OrdersController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @campaigns = @course.active_campaigns
    @order = Order.new({:user => current_user,
                        :total_amount => @course.discount_price})
  end
end
