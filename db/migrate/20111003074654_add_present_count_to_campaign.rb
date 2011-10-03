class AddPresentCountToCampaign < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :present_count, :integer
  end

  def self.down
    remove_column :campaigns, :present_count
  end
end
