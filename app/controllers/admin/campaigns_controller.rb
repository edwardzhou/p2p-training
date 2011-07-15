class Admin::CampaignsController < Admin::BaseController
  before_filter :load_course

  #attr_accessor :price, :discount_price, :status, :start_date, :end_date,
  #              :register_due_date, :description

  def show

  end

  def new
    @campaign = @course.campaigns.build({:price => @course.price,
                                         :discount_price => @course.discount_price})

  end

  def create
    @campaign = @course.campaigns.build(params[:campaign])
    @campaign.save

    redirect_to admin_course_path(@course)
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    @campaign.update_attributes( params[:campaign] )

    #redirect_to edit_admin_course_campaign_path(@course, @campaign)
    redirect_to admin_course_path(@course)
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy

    redirect_to admin_course_path(@course)
  end

  private
  def load_course
    @course = Course.find(params[:course_id]) unless params[:course_id].nil?
  end

end
