class CoursesController < ApplicationController

  before_filter :authenticate_user!, :only => [:add_to_favorite, :register]

  def show
    @course = Course.find( params[:id] )
  end

  def register

  end

end
