#encoding: utf-8

class AccountActivationMailer < ActionMailer::Base
  default :from => "admin@p2p-training.info"

  def notify_activation(user)
    @user = user

    to = "zhou-hui-qing@163.com"
    subject = "[p2p-training][帐号激活] 用户[#{@user.username} - #{@user.email}] 已激活"

    mail :to => to, :subject => subject
  end
end
