Given /^I have following user records$/ do |table|
  table.hashes.each do |user_row|
    Factory(:user, user_row)
  end
end

