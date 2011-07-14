class Admin::LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])
    if @location.save
      redirect_to( {:action => 'index'}, :notice => t("label.save_success"))
    else
      render 'new'
    end
  end


end
