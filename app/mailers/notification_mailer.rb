#encoding: utf-8

class NotificationMailer < ActionMailer::Base
  default :from => "admin@p2p-training.info"

  helper :application, :courses


  def notify_user_activation(user)
    @user = user

    to = "zhou-hui-qing@163.com"
    subject = "[p2p-training][帐号激活] 用户[#{@user.username} - #{@user.email}] 已激活"

    mail :to => to, :subject => subject
  end

  def notify_order_created(order)
    @order = order

    to = "zhou-hui-qing@163.com"
    subject = "[p2p-training][新报名] 用户[#{@order.user.username} - #{@order.user.email}] 报名课程 <#{@order.campaign.course.course_name} - #{@order.campaign.name} >"

    mail :to => to, :subject => subject
  end

  def notify_order_cancelled(order)
    @order = order

    to = "zhou-hui-qing@163.com"
    subject = "[p2p-training][报名取消] 用户[#{@order.user.username} - #{@order.user.email}] 取消课程 <#{@order.campaign.course.course_name} - #{@order.campaign.name} >"

    mail :to => to, :subject => subject
  end

  def notify_order_updated(order)
    @order = order

    to = "zhou-hui-qing@163.com"
    subject = "[p2p-training][报名修改] 用户[#{@order.user.username} - #{@order.user.email}] 修改课程报名 <#{@order.campaign.course.course_name} - #{@order.campaign.name} >"

    mail :to => to, :subject => subject
  end

  def notify_payment(payment)
    @payment = payment
    @order = payment.paid_order

    to = "zhou-hui-qing@163.com"
    subject = "[p2p-training][报名付款] 用户[#{@order.user.username} - #{@order.user.email}] 付款课程 <#{@order.campaign.course.course_name} - #{@order.campaign.name} >"

    mail :to => to, :subject => subject
  end

  def notify_comment(comment)
    @comment = comment

    to = "zhou-hui-qing@163.com"
    subject = "[p2p-training][课程评论] 用户[#{@comment.user.username} - #{@comment.user.email}] 评论课程 <#{@comment.course.course_name}>"

    mail :to => to, :subject => subject
  end

end
