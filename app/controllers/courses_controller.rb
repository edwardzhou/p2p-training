class CoursesController < ApplicationController

  before_filter :authenticate_user!, :only => [:add_to_favorite, :register]

  def index
    criteria = params[:s]
    search_result = Course.active_courses
    if criteria
      search_result = search_result.search(criteria)
    end

    @courses = search_result
  end

  def latest
    @courses = Course.latest_courses(10)
    render 'index'
  end

  def hot
    @courses = Course.hot_courses(10)
    render 'index'
  end


  def show
    @course = Course.find( params[:id] )
  end



end
