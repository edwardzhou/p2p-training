class CreateUserDetails < ActiveRecord::Migration
  def self.up
    create_table :user_details do |t|
      t.references :user
      #t.string :true_name, :limit => 20
      t.string :id_card, :limit => 20
      t.date :birthday
      t.string :company, :limit => 100
      t.string :company_size, :limit => 50
      #t.string :contact_phone, :limit => 50
      t.string :address, :limit => 200
      t.string :zip, :limit => 10

      t.timestamps
    end
  end

  def self.down
    drop_table :user_details
  end
end
