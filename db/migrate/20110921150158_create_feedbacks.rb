class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.references :campaign
      t.references :user
      t.string :true_name
      t.string :contact_phone
      t.string :email
      t.integer :useful_rating
      t.integer :content_rating
      t.integer :interact_rating
      t.string :gain_from_lesson
      t.string :interesting_feature
      t.string :advice

      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacks
  end
end
