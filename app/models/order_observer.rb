class OrderObserver < ActiveRecord::Observer
  def after_create(new_order)
    campaign = new_order.campaign
    campaign.register_count = campaign.register_count.next
    campaign.save!
    Rails.logger.info "campaign:#{campaign.id} register_count raise to #{campaign.register_count}"

    course = campaign.course
    course.total_register_count = course.total_register_count.next
    course.save!
    Rails.logger.info "course:#{course.id} total_register_count raise to #{course.total_register_count}"
  end

  def before_save(order)
    Rails.logger.info "before save order"
  end

  def before_update(order)
    if order.status_changed?
      if order.status == Order::Status::CANCELLED
        campaign = order.campaign
        campaign.register_count = campaign.register_count.pred
        campaign.save!
        Rails.logger.info "campaign:#{campaign.id} total_register_count down to #{campaign.register_count}"

        course = campaign.course
        course.total_register_count = course.total_register_count.pred
        course.save!
        Rails.logger.info "course:#{course.id} total_register_count down to #{course.total_register_count}"
      end
    end
  end
end
