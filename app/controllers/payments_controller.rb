#encoding: utf-8
class PaymentsController < ApplicationController

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

    @order = Order.by_code(notification.out_trade_no)

    if payment = Payment.find_by_notify_id(notification.notify_id)
      payment.update_attributes(payment_attributes)
    else
      payment_attributes.merge!(:notify_id => notification.notify_id)
      unless @order.nil?
        payment_attributes.merge!(:order_id => @order.id)
      end
      payment = Payment.create(payment_attributes)
    end

    if payment
      #@order = Order.by_code(payment.out_trade_no)
      if @order.nil?
        logger.error("[PAYMENT] Cannot find Order[#{payment.out_trade_no}] to update payment status.")
      else
        if (payment.trade_status == Payment::Status::SUCCESS) or
            (payment.trade_status == Payment::Status::FINISHED)
          @order.status = Order::Status::PAID
          @order.paid_time = notification.gmt_payment
          @order.save!
        end
      end

      NotificationMailer.notify_payment(payment).deliver

      render :text => "success"
    else
      render :text => "failure"
    end

  end

  def done
    r = ActiveMerchant::Billing::Integrations::Alipay::Return.new(request.query_string)
    if r.success?
      flash[:notice] = '成功！'
    else
      flash[:error] = '付款失败！'
    end
    redirect_to({:controller => 'orders', :action => 'index'})
  end

end
