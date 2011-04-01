# encoding: utf-8

def create_users(table)
  table.hashes.each do |user_row|
    confirmed = user_row.delete('confirmed')

    user = Factory(:user, user_row)
    user.confirm! if confirmed
  end
end

Given /^I have following user records$/ do |table|
  create_users table
end

Given /^我有如下用户记录$/ do |table|
  create_users table
end
