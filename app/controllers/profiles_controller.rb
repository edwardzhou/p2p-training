class ProfilesController < ApplicationController

  before_filter :load_user

  def edit
  end

  def update
    user_attributes = params[:user]
    user_attributes.delete('username')
    user_attributes.delete('email')

    if @user.update_attributes(user_attributes)
      redirect_to '/', :notice => t('label.save_success')
    else
      render 'edit'
    end
  end


  def my_invitations
    @invited_users = User.invited_users(@user.username).order('created_at DESC')
  end


  private
  def load_user
    @user = current_user
  end


end
