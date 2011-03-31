Factory.sequence :true_name do |n|
  "true_name_#{n}"
end

Factory.sequence :contact_phone do |n|
  "555555_#{n}"
end

Factory.define :user_detail do |ud|
  ud.true_name Factory.next(:true_name)
  ud.contact_phone Factory.next(:contact_phone)
end

Factory.define :user do |user|
  user.association :user_detail, :factory => :user_detail
end