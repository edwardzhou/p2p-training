class AddDisplayOrderToCourse < ActiveRecord::Migration
  def self.up
    add_column :courses, :display_order, :integer
  end

  def self.down
    remove_column :courses, :display_order
  end
end
