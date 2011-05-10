class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.string :name, :limit => 50
      t.date :start_date
      t.date :end_date
      t.date :register_due_date
      t.references :course
      t.references :trainer
      t.string :status, :limit => 50, :default => 'open'
      t.decimal :price, :scale => 2
      t.decimal :discount_price, :scale => 2
      t.references :training_room
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :campaigns
  end
end
