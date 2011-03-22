class AddMoreFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :nick_name, :string
    add_column :users, :gender, :string
  end

  def self.down
    remove_column :users, :gender
    remove_column :users, :nick_name
  end
end
