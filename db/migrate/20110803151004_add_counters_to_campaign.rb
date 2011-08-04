class AddCountersToCampaign < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :register_count, :integer, :default => 0
  end

  def self.down
    remove_column :campaigns, :register_count
  end
end
