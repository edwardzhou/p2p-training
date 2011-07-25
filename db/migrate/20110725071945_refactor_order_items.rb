class RefactorOrderItems < ActiveRecord::Migration
  def self.up
    add_column :order_items, :joiner_id, :integer
  end

  def self.down
    remove_column :order_items, :joiner_id
  end
end
