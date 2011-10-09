class Admin::PaymentsController < Admin::BaseController
  def index
    @payments = Payment.order("created_at DESC")
  end
end
