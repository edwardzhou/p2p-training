class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.string :notify_id
      t.datetime :notify_time
      t.string :trade_no
      t.string :trade_status
      t.decimal :total_amount
      t.string :buyer_email
      t.text :raw_post

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
