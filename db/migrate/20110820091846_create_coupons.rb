class CreateCoupons < ActiveRecord::Migration
  def self.up
    create_table :coupons do |t|
      t.string :coupon_code
      t.string :coupon_name
      t.integer :qty
      t.integer :discount_rate
      t.datetime :due_date
      t.boolean :disabled
      t.references :course
      t.references :campaign

      t.timestamps
    end
  end

  def self.down
    drop_table :coupons
  end
end
