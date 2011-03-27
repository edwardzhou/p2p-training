class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :course_name
      t.string :version
      t.string :status
      t.belongs_to :catalog
      t.text :short_description
      t.text :long_description

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
