class Admin::CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

end
