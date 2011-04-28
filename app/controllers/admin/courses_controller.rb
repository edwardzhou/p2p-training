class Admin::CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(params[:course])
    if @course.save
      redirect_to :action => 'index', :notice => t('label.save_success')
    else
      render 'new'
    end
  end

end
