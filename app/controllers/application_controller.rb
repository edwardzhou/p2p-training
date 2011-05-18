class ApplicationController < ActionController::Base
  include UrlHelper

  protect_from_forgery

  before_filter :set_mailer_url_options

  def after_sign_in_path_for(resource)
    location = stored_location_for(:user) || root_path

    if current_user.role?('admin')
      location = admin_dashboards_path
    end

    location
  end

end
