class Admin::CampaignsController < Admin::BaseController
  before_filter :load_course

  #attr_accessor :price, :discount_price, :status, :start_date, :end_date,
  #              :register_due_date, :description

  def index
    @campaigns = Campaign.where(:name.like => "%#{params[:q].strip}%")
    respond_to do |format|
      format.json {render :json => @campaigns.collect{|c| {:id => c.id, :name => "#{c.course.course_name} - #{c.name}"} }.to_json }
    end
  end

  def show

  end

  def new
    @campaign = @course.campaigns.build({:price => @course.price,
                                         :discount_price => @course.discount_price})

  end

  def create
    campaign_attributes = delete_time_for_null_date(params[:campaign])
    @campaign = @course.campaigns.build(campaign_attributes)
    @campaign.save

    redirect_to admin_course_path(@course)
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    campaign_attributes = delete_time_for_null_date(params[:campaign])
    @campaign = Campaign.find(params[:id])
    @campaign.update_attributes( campaign_attributes )

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
    @course = Course.find(params[:course_id]) unless (params[:course_id].nil? || (params[:course_id].to_i < 1))
  end

  def delete_time_for_null_date(attributes)
    ["start_date", "end_date", "register_due_date"].each do |the_date|
      if attributes["#{the_date}_date"].blank?
        attributes.delete("#{the_date}_time")
      end
    end

    attributes
  end

end
