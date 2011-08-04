class OrderObserver < ActiveRecord::Observer
  def after_create(new_order)
    campaign = new_order.campaign
    campaign.total_register_count = campaign.total_register_count.next
    campaign.save!

    course = campaign.course
    course.total_register_count = course.total_register_count.next
    course.save!
  end

  def before_update(order)
    if order.status_changed?
      if order.status == Order::Status::CANCELLED
        campaign = order.campaign
        campaign.total_register_count = campaign.total_register_count.pred
        campaign.save!

        course = campaign.course
        course.total_register_count = course.total_register_count.pred
        course.save!
      end
    end
  end
end
