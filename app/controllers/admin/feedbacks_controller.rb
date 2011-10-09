class Admin::FeedbacksController < ApplicationController
  before_filter :load_course_and_campaign

  def index
    @feedbacks = @campaign.feedbacks
  end


  private
  def load_course_and_campaign
    unless params[:course_id].blank?
      @course = Course.find(params[:course_id])
    end

    unless params[:campaign_id].blank?
      @campaign = Campaign.find(params[:campaign_id])
      @course ||= @campaign.course
    end
  end
end
