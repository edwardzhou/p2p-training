# encoding: utf-8

Given /^I have following catalog records$/ do |table|
  table.hashes.each do |row|
    Factory(:catalog, row)
  end
end

When /^我有如下目录:$/ do |table|
  # table is a |编程           |true       |
  table.hashes.each do |row|
    Factory(:catalog, row)
  end
end

When /^我有如下课程:$/ do |table|
  # table is a |设计模式        |opening    |编程         |
  table.hashes.each do |row|
    catalog_name = row.delete('catalog')
    catalog = Catalog.find_by_name(catalog_name) if catalog_name

    course = Factory(:course, row)
    course.catalogs << catalog if catalog
  end
end
