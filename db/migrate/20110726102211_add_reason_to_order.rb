class AddReasonToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :reason, :text
  end

  def self.down
    remove_column :orders, :reason
  end
end
