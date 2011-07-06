class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :order_code, :limit => 20
      t.references :user
      t.decimal :total_amount
      t.string :status, :limit => 20
      t.boolean :payable, :default => false
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
