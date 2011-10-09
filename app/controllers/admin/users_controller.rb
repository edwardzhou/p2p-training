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

  def search
    query = "%#{params[:q].strip}%"
    @users = User.where({:username.like => query} |
                        {:email.like => query} |
                        {:true_name.like => query} |
                        {:contact_phone.like => query}).order("true_name")
    respond_to do |format|
      format.json {render :json => @users.collect{|c| {:id => c.id, :name => "#{c.true_name}"} }.to_json }
    end
  end


end
