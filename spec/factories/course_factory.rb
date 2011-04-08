Factory.define :course do |course|

end

Factory.define :course_catalog_with, :parent => :course do |course|
  course.association(:catalogs)
end