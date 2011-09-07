class CampaignsController < ApplicationController

  def show
    @campaign = Campaign.find(params[:id])
    @course = @campaign.course
  end

  def finished

    @course = Course.find(params[:course_id])
    @campaigns = @course.finished_campaigns

  end


end
