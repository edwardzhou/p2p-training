#encoding: utf-8
module CoursesHelper
  def register_due_date(campaign)
    due_date = campaign.register_due_date
    due_date ||= "满40人截止"
  end

  def start_date(campaign)
    the_date = campaign.start_date
    the_date ||= "满20人起开课"
  end

end
