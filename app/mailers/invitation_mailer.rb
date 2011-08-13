#encoding: utf-8

class InvitationMailer < ActionMailer::Base
  default :from => "edward.zhq@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.invite.subject
  #
  def invite(invitation)
    @invitation = invitation
    @invitation_url = new_user_registration_url(:ref => invitation.user.username)
    mail :to => invitation.friend_email, :subject => "您的朋友[#{invitation.my_name}]邀请您加入p2p-training.com"
  end
end
