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
      format.html do
        redirect_to( {:action => 'index'}, :notice => "收藏成功!" )
      end
      format.js
    end
  end

end
