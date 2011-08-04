class AddCountersToCourse < ActiveRecord::Migration
  def self.up
    add_column :courses, :total_interesting_count, :integer, :default => 0
    add_column :courses, :total_register_count, :integer, :default => 0
  end

  def self.down
    remove_column :courses, :total_register_count
    remove_column :courses, :total_interesting_count
  end
end
