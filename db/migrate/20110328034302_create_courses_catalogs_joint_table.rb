class CreateCoursesCatalogsJointTable < ActiveRecord::Migration
  def self.up
    create_table :catalogs_courses, :id => false do |t|
      t.integer :catalog_id, :null => false
      t.integer :course_id, :null => false
    end
  end

  def self.down
    drop_table :catalogs_courses
  end
end
