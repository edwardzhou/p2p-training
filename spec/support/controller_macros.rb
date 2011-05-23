module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @user = Factory.create(:admin_user)
      @user.confirm!
      sign_in @user
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = Factory.create(:user)
      @user.confirm!
      sign_in @user
    end
  end

end
