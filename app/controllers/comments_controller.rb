class CommentsController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @comments = @course.comments
  end

  def destroy
    @course = Course.find(params[:course_id])
    @comment = Comment.find(params[:id])
    @comment.destroy unless @comment.nil?
  end
end
