class AddRefundedTimeToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :refunded_time, :datetime
  end

  def self.down
    remove_column :orders, :refunded_time
  end
end
