class Admin::OrdersController < Admin::BaseController

  def index
    @orders = Order.latest_orders
  end

  def show

  end

end
