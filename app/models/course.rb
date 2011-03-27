class Course < ActiveRecord::Base
  belongs_to :catalog

  validates_presence_of :course_name
  validates_uniqueness_of :course_name

end
