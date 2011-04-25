#encoding: utf-8

class Admin::CatalogsController < ApplicationController
  def index
    @catalogs = Catalog.root_catalogs
  end

  def new
    @catalog ||= Catalog.new
  end

  def create
    @catalog = Catalog.new( params[:catalog] )
    if @catalog.save then
      redirect_to admin_catalogs_path, :notice => "保存成功"
    else
      #flash[:notice] = "保存失败: #{@catalog.name} 已经存在"
      #redirect_to :action => 'new'
      render 'new'
    end
  end

  def edit
    @catalog = Catalog.find(params[:id])
  end

  def update
    @catalog = Catalog.find(params[:id])
    if @catalog.update_attributes(params[:catalog])
      redirect_to admin_catalogs_path, :notice => "修改成功"
    else
      render 'edit'
    end
  end

end
