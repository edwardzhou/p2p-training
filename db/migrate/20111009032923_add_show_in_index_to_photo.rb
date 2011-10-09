class AddShowInIndexToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :show_in_index, :boolean
  end

  def self.down
    remove_column :photos, :show_in_index
  end
end
