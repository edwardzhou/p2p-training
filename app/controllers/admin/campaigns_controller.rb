class Admin::CampaignsController < ApplicationController
  before_filter :load_course

  def show

  end

  def new
    @campaign = @course.campaigns.build({:price => @course.price,
                                         :discount_price => @course.discount_price})

  end

  def create
    @campaign = @course.campaigns.build(params[:campaign])
    @campaign.save

    redirect_to [:admin, @course]

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def load_course
    @course = Course.find(params[:course_id]) unless params[:course_id].nil?
  end

end
