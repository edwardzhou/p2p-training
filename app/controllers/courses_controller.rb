class CoursesController < ApplicationController

  before_filter :authenticate_user!

  load_and_authorize_resource
  check_authorization :only => [:add_to_favorite, :register]

  # before_filter :authenticate_user!

  def add_to_favorite

  end

end
