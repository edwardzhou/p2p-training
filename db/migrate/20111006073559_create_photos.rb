class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.references :album
      t.integer :display_order
      t.string :description
      t.string :image

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
