class CreateUserDetails < ActiveRecord::Migration
  def self.up
    create_table :user_details do |t|
      t.int :user_id
      t.string :true_name
      t.string :company
      t.string :contact_phone
      t.string :address
      t.string :zip

      t.timestamps
    end
  end

  def self.down
    drop_table :user_details
  end
end
