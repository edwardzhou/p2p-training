class AddStartTimeAndEndTimeToCampaign < ActiveRecord::Migration
  def self.up
    change_column :campaigns, :start_date, :datetime
    change_column :campaigns, :end_date, :datetime
    change_column :campaigns, :register_due_date, :datetime
  end

  def self.down
    change_column :campaigns, :start_date, :date
    change_column :campaigns, :end_date, :date
    change_column :campaigns, :register_due_date, :date
  end
end
