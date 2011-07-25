class RefactorOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :campaign_id, :integer
    add_column :orders, :paid_time, :datetime
  end

  def self.down
    remove_column :orders, :campaign_id
    remove_column :orders, :paid_time
  end
end
