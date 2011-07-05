class CommentsController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @comments = @course.comments
  end
end
