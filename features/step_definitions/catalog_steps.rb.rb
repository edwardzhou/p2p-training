Given /^I have following catalog records$/ do |table|
  table.hashes.each do |row|
    Factory(:catalog, row)
  end
end