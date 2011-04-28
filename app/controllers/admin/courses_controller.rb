class Admin::CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(params[:course])
    if @course.save
      redirect_to( {:action => 'index'}, :notice => t('label.save_success'))
    else
      render 'new'
    end
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(params[:course])
      redirect_to( {:action => 'index'}, :notice => t("label.save_success") )
    else
      render 'new'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.destroy
      redirect_to( {:action => 'index'}, :notice => t("label.delete_success") )
    else
      redirect_to( { :action=>'index' } )
    end
  end

end
