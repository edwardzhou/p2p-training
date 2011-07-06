class CommentsController < ApplicationController
  before_filter :load_course
  def index
    @comments = @course.comments
  end

  def new
    @comment = @course.comments.build
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.course = @course
    @comment.user = current_user
    @comment.save
  end

  def destroy
    @course = Course.find(params[:course_id])
    @comment = Comment.find(params[:id])
    @comment.destroy unless @comment.nil?
  end

  def load_course
    @course = Course.find(params[:course_id])
  end
end
