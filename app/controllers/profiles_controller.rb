class ProfilesController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    user_attributes = params[:user]
    user_attributes.delete('username')
    user_attributes.delete('email')

    if @user.update_attributes(user_attributes)
      redirect_to '/', :notice => t('label.save_success')
    else
      render 'edit'
    end
  end

end
