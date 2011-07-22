class CreateKeyNumbers < ActiveRecord::Migration
  def self.up
    create_table :key_numbers do |t|
      t.string :name
      t.string :pattern
      t.integer :current

      t.timestamps
    end
  end

  def self.down
    drop_table :key_numbers
  end
end
