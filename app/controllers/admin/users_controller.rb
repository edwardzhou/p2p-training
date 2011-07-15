class Admin::UsersController < Admin::BaseController

  def index
    @users = User.order('username ASC')
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to( {:action => 'index'}, :notice => t("label.edit_success"))
    else
      render 'edit'
    end
  end


end
