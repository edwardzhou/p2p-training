class CampaignsController < ApplicationController

  def show
    @campaign = Campaign.find(params[:id])
    @course = @campaign.course
  end

end
