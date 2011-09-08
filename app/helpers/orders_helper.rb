#encoding: utf-8

module OrdersHelper
  def is_order_exists?(campaign_ids)
    current_user.orders \
      .where(:campaign_id => campaign_ids) \
      .where(:status.not_eq => Order::Status::CANCELLED).count > 0
  end

  def even_odd(index)
    index.even? ? "even" : "odd"
  end

  def coupon_info(order)
    coupon = order.coupon
    campaign = order.campaign
    if coupon.discount_type == Coupon::Type::BY_RATE
      msg = "优惠折扣 #{coupon.discount_rate}%. #{format("￥%.2f",campaign.discount_price)} x #{coupon.discount_rate}% = #{format('￥%.2f', order.total_amount)}。"
    else
      msg = "直接优惠价 #{format('￥%.2f', order.total_amount)}。"
    end

    msg
  end

end
