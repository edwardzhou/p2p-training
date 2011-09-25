#encoding: utf-8
module CoursesHelper
  def register_due_date(campaign)
    due_date = campaign.register_due_date
    due_date ||= "满25人截止"
  end

  def start_date(campaign)
    the_date = campaign.start_date
    the_date ||= "满10人起开课"
  end

end
