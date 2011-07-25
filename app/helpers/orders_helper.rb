module OrdersHelper
  def is_order_exists?(campaign_ids)
    current_user.orders \
      .where(:campaign_id => campaign_ids) \
      .where(:status.not_eq => Order::Status::CANCELLED).count > 0
  end
end
