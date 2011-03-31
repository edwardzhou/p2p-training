When /^I should see a link "([^\"]*)"(?: within "([^"]*)")?$/ do |locator, selector|
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_link(locator)
    else
      assert page.has_link?(locator)
    end
  end
end