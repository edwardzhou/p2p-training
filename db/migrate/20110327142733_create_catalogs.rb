class CreateCatalogs < ActiveRecord::Migration
  def self.up
    create_table :catalogs do |t|
      t.string :name
      t.string :description
      t.boolean :enabled, :default => true
      t.references :parent_catalog

      t.timestamps
    end
  end

  def self.down
    drop_table :catalogs
  end
end
