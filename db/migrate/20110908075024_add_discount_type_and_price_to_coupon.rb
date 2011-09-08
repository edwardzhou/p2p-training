class AddDiscountTypeAndPriceToCoupon < ActiveRecord::Migration
  def self.up
    add_column :coupons, :discount_type, :integer
    add_column :coupons, :discount_price, :decimal
  end

  def self.down
    remove_column :coupons, :discount_price
    remove_column :coupons, :discount_type
  end
end
