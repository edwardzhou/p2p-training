class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :city, :limit => 50
      t.string :address, :limit => 200
      t.string :zip, :limit => 20
      t.string :contact_phone, :limit => 50
      t.string :map_url, :limit => 250

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
