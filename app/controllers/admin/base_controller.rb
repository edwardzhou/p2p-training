class Admin::BaseController < ApplicationController

  before_filter :authenticate_user!

  load_and_authorize_resource
  check_authorization

  #layout 'administration'

  #rescue_from CanCan::AccessDenied do |exception|
  #  flash[:alert] = exception.message
  #  redirect_to root_url
  #end
  #

end