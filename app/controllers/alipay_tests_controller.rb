#encoding: utf-8
class AlipayTestsController < ApplicationController

  def index
    @payments = Payment.order('notify_time DESC')
  end

  def new

  end

  def notify
    notification = ActiveMerchant::Billing::Integrations::Alipay::Notification.new(request.raw_post)

    payment_attributes = {
        :total_amount => notification.total_fee,
        :trade_status => notification.trade_status,
        :trade_no     => notification.trade_no,
        :out_trade_no => notification.out_trade_no,
        :notify_time  => notification.notify_time,
        :notify_type  => notification.notify_type,
        :gmt_create   => notification.gmt_create,
        :gmt_payment  => notification.gmt_payment,
        :subject      => notification.subject,
        :body         => notification.body,
        :price        => notification.price,
        :quantity     => notification.quantity,
        :use_coupon   => notification.use_coupon?,
        :buyer_email  => notification.buyer_email,
        :sign_type    => params[:sign_type],
        :sign         => params[:sign],
        :raw_post     => request.raw_post
    }

    if payment = Payment.find_by_notify_id(notification.notify_id)
      result = payment.update_attributes(payment_attributes)
    else
      payment_attributes.merge!(:notify_id => notification.notify_id)
      result = Payment.create(payment_attributes)
    end

    if result
      render :text => "success"
    else
      render :text => "failure"
    end

  end

  def done
    r = ActiveMerchant::Billing::Integrations::Alipay::Return.new(request.query_string)
    if r.success?
      flash[:notice] = '捐助成功！'
    else
      flash[:error] = '捐助失败！'
    end
    redirect_to({:action => 'index'})
  end

end
