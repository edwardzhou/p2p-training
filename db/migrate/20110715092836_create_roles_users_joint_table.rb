class CreateRolesUsersJointTable < ActiveRecord::Migration
  def self.up
    create_table :roles_users, :id => false do |t|
      t.integer :role_id, :null => false
      t.integer :user_id, :null => false
    end
  end

  def self.down
    drop_table :roles_users
  end
end
