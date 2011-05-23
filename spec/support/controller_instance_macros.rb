module ControllerInstanceMacros
  def logout
    sign_out :user
  end
end