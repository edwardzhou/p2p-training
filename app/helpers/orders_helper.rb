module OrdersHelper
  def is_order_exists?(campaign_ids)
    current_user.orders.joins(:order_items) \
      .where(:order_items => {:campaign_id => campaign_ids}) \
      .where(:status.not_eq => 'cancel').count > 0
  end
end
