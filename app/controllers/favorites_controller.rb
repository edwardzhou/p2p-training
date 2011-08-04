#encoding: utf-8

class FavoritesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @favorites = current_user.favorites
  end

  def create
    course_id = params[:course_id]
    unless current_user.interested_course?(course_id)
      favorite = Favorite.new({:user => current_user, :course_id => course_id})
      favorite.save!
    end

    respond_to do |format|
      format.html { redirect_to({:action => 'index'}, :notice => "关注成功!") }
      format.js
    end
  end

  def destroy
    @favorite = Favorite.find( params[:id] )
    @favorite.destroy

    respond_to do |format|
      format.html { redirect_to({:action => 'index'}, :notice => "删除成功!") }
      format.js
    end

  end

end
