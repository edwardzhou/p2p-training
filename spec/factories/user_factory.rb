Factory.sequence :true_name do |n|
  "true_name_#{n}"
end

Factory.sequence :username do |n|
  "username_#{n}"
end

Factory.sequence :email do |n|
  "email_#{n}@noexist.xxx"
end

Factory.sequence :contact_phone do |n|
  "555555_#{n}"
end

Factory.define :user_detail do |ud|
end

def setup_user(user, role="user")
  #user.association(:roles)
  user.username { Factory.next :username }
  user.email { Factory.next :email }
  user.true_name { Factory.next :true_name }
  user.contact_phone { Factory.next :contact_phone }
  user.password { "123456" }
  user.password_confirmation { "123456" }
  #user.roles << Role.new({:name => role})
  user.gender { "male" }
  user.association :user_detail, :factory => :user_detail
  user
end

Factory.define :user do |user|
  setup_user user, "user"
end

Factory.define :trainer,:parent => :user do |user|
  user.association(:roles)
  #setup_user user, "trainer"
end

Factory.define :admin_user, :class => User do |admin|
  setup_user admin, "admin"
end