class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    location = stored_location_for(:user) || root_path

    if current_user.role?('admin')
      location = admin_dashboards_path
    end

    location
  end

end
