#encoding: utf-8

class Admin::CatalogsController < ApplicationController
  def index
    @catalogs = Catalog.root_catalogs
  end

  def new
    @catalog ||= Catalog.new
  end

  def edit
    @catalog = Catalog.find(params[:id])
  end

  def create
    @catalog = Catalog.new( params[:catalog] )
    if @catalog.save then
      redirect_to( {:action => 'index'}, :notice => t("label.save_success"))
    else
      #flash[:notice] = "保存失败: #{@catalog.name} 已经存在"
      #redirect_to :action => 'new'
      render 'new'
    end
  end

  def update
    @catalog = Catalog.find(params[:id])
    if @catalog.update_attributes(params[:catalog])
      redirect_to( {:action => 'index'}, :notice => t("label.edit_success"))
    else
      render 'edit'
    end
  end

  def destroy
    @catalog = Catalog.find(params[:id])

    if @catalog.courses.size == 0 && @catalog.destroy
      redirect_to( {:action => 'index'}, :notice => t("label.delete_success"))
    else
      redirect_to( {:action => 'index'}, :alert => "删除失败: #{@catalog.name}存在课程")
    end
  end

  def enable
    @catalog = Catalog.find(params[:id])
    @catalog.enabled = true

    if @catalog.save
      redirect_to( {:action => 'index'}, :notice => t("label.enable_success"))
    else
      redirect_to( {:action => 'index'} )
    end
  end

  def disable
    @catalog = Catalog.find(params[:id])
    @catalog.enabled = false

    if @catalog.save
      redirect_to( {:action => 'index'}, :notice => t("label.disable_success"))
    else
      redirect_to( {:action => 'index'} )
    end
  end

end
