# encoding: utf-8

def create_users(table)
  table.hashes.each do |user_row|
    confirmed = user_row.delete('confirmed')

    user = Factory(:user, user_row)
    user.confirm! if confirmed
    #user
  end
end

Given /^I have following user records$/ do |table|
  create_users table
end

Given /^我有如下用户记录$/ do |table|
  create_users table
end

Given /^我已经登录为"([^"]*)"$/ do |username|
  user = Factory(:user, {
      :username => username,
      :email => "#{username}@p2p-training.com",
      :password => "123456",
      :password_confirmation => "123456",
      :gender => "male",
      :true_name => "#{username}",
      :contact_phone => "1234543333"
  })
  user.confirm!
  visit new_user_session_path
  fill_in "用户名或邮箱", :with => "#{username}"
  fill_in "密码", :with => "123456"
  click_button "登录"
end
