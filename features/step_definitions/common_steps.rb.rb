When /^I should see a link "([^"]*)"$/ do |locator|
  if page.respond_to? :should
    page.should have_link(locator)
  else
    assert page.has_link?(locator)
  end
end

When /^I dump page content$/ do
  p page.source
end