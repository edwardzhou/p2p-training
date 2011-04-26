#encoding: utf-8

When /^I should see a link "([^"]*)"$/ do |locator|
  if page.respond_to? :should
    page.should have_link(locator)
  else
    assert page.has_link?(locator)
  end
end

When /^(?:|我)应当看[到|见][链,连]接\s*"([^"]*)"$/ do |locator|
  if page.respond_to? :should
    page.should have_link(locator)
  else
    assert page.has_link?(locator)
  end
end

When /^I dump page content$/ do
  p page.source
end