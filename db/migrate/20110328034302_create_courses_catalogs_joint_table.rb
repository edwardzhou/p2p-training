class CreateCoursesCatalogsJointTable < ActiveRecord::Migration
  def self.up
    create_table :courses_catalogs, :id => false do |t|
      t.integer :course_id, :null => false
      t.integer :catalog_id, :null => false
    end
  end

  def self.down
    drop_table :courses_catalogs
  end
end
