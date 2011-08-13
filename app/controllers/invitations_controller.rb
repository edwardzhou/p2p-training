#encoding: utf-8

class InvitationsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_user

  def index
    @invited_users = User.invited_users(@user.username).order('created_at DESC')
  end

  def new
    @invitation = Invitation.new({:user => @user, :my_name => @user.username})
  end

  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.user = @user
    if @invitation.save
      InvitationMailer.invite(@invitation).deliver
      redirect_to({:action => "index"}, :notice => "邀请发送成功!")
    else
      render "new"
    end
  end

  def invite
    user = User.find_by_username( params[:id] )
    session['reference_to'] = user.username unless user.nil?
    redirect_to new_user_registration_path
  end

  private
  def load_user
    @user = current_user
  end

end
