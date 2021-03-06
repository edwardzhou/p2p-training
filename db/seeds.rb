# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
["admin", "trainer", "user", "guest"].each do |role|
  Role.find_or_create_by_name(role)
end

[{"order_id" => "%y%{index}"}].each do |pair|
  pair.each_pair do |key, value|
    key_num = KeyNumber.find_or_create_by_name(key)
    key_num.pattern = value
    key_num.next_value ||= 1
    key_num.save!
  end
end