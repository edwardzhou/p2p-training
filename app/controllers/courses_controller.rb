class CoursesController < ApplicationController

  before_filter :authenticate_user!, :only => [:add_to_favorite, :register]

  def register

  end

  def show
    @course = Course.find( params[:id] )
  end

end
