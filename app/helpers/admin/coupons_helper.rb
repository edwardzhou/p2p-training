module Admin::CouponsHelper
  def pre_course(course)
    unless course.nil?
      arr = [course]
    end
    arr ||= []

    arr.collect{|c| {:id => c.id, :name => c.course_name}}.to_json
  end

  def pre_campaign(campaign)
    unless campaign.nil?
      arr = [campaign]
    end
    arr ||= []

    arr.collect{|c| {:id => c.id, :name => "#{c.course.course_name} - #{c.name}"}}.to_json
  end

end
