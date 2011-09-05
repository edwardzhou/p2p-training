class AddPresentToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :present, :boolean
  end

  def self.down
    remove_column :orders, :present
  end
end
