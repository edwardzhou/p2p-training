Factory.sequence :true_name do |n|
  "true_name_#{n}"
end

Factory.sequence :contact_phone do |n|
  "555555_#{n}"
end

Factory.define :user_detail do |ud|
end

Factory.define :user do |user|
  user.association :user_detail, :factory => :user_detail
end