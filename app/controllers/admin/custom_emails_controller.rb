class Admin::CustomEmailsController < ApplicationController
  def index

  end

  def create
    picked_users = params[:picked_users]
    subject = params[:mail_subject]
    content = params[:mail_content]
    to = []
    picked_users.each do |pu|
      user = User.find(pu)
      to << user.email
    end

    NotificationMailer.notify_custom(nil, subject, content, :bcc => to).deliver

    redirect_to({:action => "index"}, :notice => "email(s) sent!")
  end
end
