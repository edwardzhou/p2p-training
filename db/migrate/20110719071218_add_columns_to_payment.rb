class AddColumnsToPayment < ActiveRecord::Migration
  def self.up
    add_column :payments, :out_trade_no, :string
    add_column :payments, :gmt_create, :datetime
    add_column :payments, :gmt_payment, :datetime
    add_column :payments, :use_coupon, :boolean
    add_column :payments, :subject, :string
    add_column :payments, :body, :string
    add_column :payments, :price, :decimal
    add_column :payments, :quantity, :decimal
    add_column :payments, :sign_type, :string
    add_column :payments, :sign, :string
    add_column :payments, :notify_type, :string
  end

  def self.down
    remove_column :payments, :notify_type
    remove_column :payments, :sign
    remove_column :payments, :sign_type
    remove_column :payments, :body
    remove_column :payments, :subject
    remove_column :payments, :price
    remove_column :payments, :quantity
    remove_column :payments, :use_coupon
    remove_column :payments, :gmt_payment
    remove_column :payments, :gmt_create
    remove_column :payments, :out_trade_no
  end
end
