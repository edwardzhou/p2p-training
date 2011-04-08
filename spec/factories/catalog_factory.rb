Factory.define :catalog do |catalog|
  catalog.name 'Programming'
  catalog.enabled true
end

Factory.define :catalog_with_course, :parent => :catalog do |catalog|
  catalog.association(:courses)
end