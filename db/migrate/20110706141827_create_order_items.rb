class CreateOrderItems < ActiveRecord::Migration
  def self.up
    create_table :order_items do |t|
      t.references :order
      t.references :campaign
      t.integer :qty
      t.decimal :price, :scale => 2
      t.decimal :discount_price, :scale => 2
      t.decimal :amount, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :order_items
  end
end
