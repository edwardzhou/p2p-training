class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  check_authorization

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end


end