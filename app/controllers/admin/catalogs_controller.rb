#encoding: utf-8

class Admin::CatalogsController < ApplicationController
  def index
    @catalogs = Catalog.root_catalogs
  end

  def new
    @catalog = Catalog.new
  end

  def create
    @catalog = Catalog.new( params[:catalog] )
    if @catalog.save then
      flash[:notice] = "保存成功"
      redirect_to admin_catalogs_path
    else
      render 'new'
    end

  end

end
