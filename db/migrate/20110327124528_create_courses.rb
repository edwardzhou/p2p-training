class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :course_name
      t.string :version
      t.string :status
      t.text :short_description
      t.text :long_description
      t.integer :duration_in_hours
      t.integer :total_rating
      t.decimal :price, :scale => 2
      t.decimal :discount_price, :scale => 2
      t.string :avatar

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
