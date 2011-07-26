class AddPaidDateAndRefundedDateToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :paid_date, :datetime
    add_column :orders, :refunded_date, :datetime
  end

  def self.down
    remove_column :orders, :refunded_date
    remove_column :orders, :paid_date
  end
end
