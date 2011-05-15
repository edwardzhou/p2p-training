# encoding: utf-8

def create_users(table)
  table.hashes.each do |user_row|
    confirmed = user_row.delete('confirmed')

    user = Factory(:user, user_row)
    user.confirm! if confirmed
    #user
  end
end

def setup_user(username, role, confirmed=true)
  user = Factory(:user, {
      :username => username,
      :email => "#{username}@p2p-training.com",
      :password => "123456",
      :password_confirmation => "123456",
      :gender => "male",
      :true_name => "#{username}",
      :contact_phone => "1234543333",
      :role => role
  })
  user.confirm! if confirmed

  user
end

def login_user(user)
  visit new_user_session_path
  fill_in "用户名或邮箱", :with => "#{user.username}"
  fill_in "密码", :with => "#{user.password}"
  click_button "登录"
end

Given /^I have following user records$/ do |table|
  create_users table
end

Given /^我有如下用户记录$/ do |table|
  create_users table
end

Given /^我已经登录为管理员"([^"]*)"$/ do |username|
  user = setup_user(username, 'admin')
  login_user user
end

Given /^我已经登录为"([^"]*)"$/ do |username|
  user = setup_user(username, 'user')
  login_user user
end
