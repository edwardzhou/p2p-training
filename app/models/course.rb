class Course < ActiveRecord::Base
  has_and_belongs_to_many :catalogs

  validates_presence_of :course_name
  validates_uniqueness_of :course_name

end
