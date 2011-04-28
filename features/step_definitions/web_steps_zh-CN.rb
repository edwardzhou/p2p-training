# encoding: utf-8
# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

#module WithinHelpers
#  def with_scope(locator)
#    locator ? within(locator) { yield } : yield
#  end
#end
#World(WithinHelpers)















# Single-line step scoper
When /^(?:|我)在\s*("[^"]+")\s*里面\s*(.*)$/ do |parent, step|
  with_scope(parent) { When step }
end


# Multi-line step scoper
When /^(?:|我)在\s*("[^"]+")\s*里面\s*([^:]+):$/ do |parent, step, table_or_string|
  with_scope(parent) { When "#{step}:", table_or_string }
end

Given /^(?:|我)位于\s*(.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|我)打开\s*(.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|我)按下按钮\s*"([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|我)点击[链,连]接\s*"([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|我)填入\s*"([^"]*)"\s*到\s*"([^"]*)"$/ do |value, field|
  fill_in(field, :with => value)
end

When /^(?:|我)[给在为]\s*"([^"]*)"\s*填[入|上|写]\s*"([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

# Use this to fill in an entire form with data from a table. Example:
#
#   When I fill in the following:
#     | Account Number | 5002       |
#     | Expiry date    | 2009-11-01 |
#     | Note           | Nice guy   |
#     | Wants Email?   |            |
#
# TODO: Add support for checkbox, select og option
# based on naming conventions.
#
When /^(?:|我)填入下列:$/ do |fields|
  fields.rows_hash.each do |name, value|
    When %{我给"#{name}" 填入 "#{value}"}
  end
end

When /^(?:|我)从\s*"([^"]*)"\s*选取\s*"([^"]*)"$/ do |field, value|
  select(value, :from => field)
end

When /^(?:|我)勾上\s*"([^"]*)"$/ do |field|
  check(field)
end

When /^(?:|我)取消勾上\s*"([^"]*)"$/ do |field|
  uncheck(field)
end

When /^(?:|我)选择\s*"([^"]*)"$/ do |field|
  choose(field)
end

When /^(?:|我)附加文件\s*"([^"]*)"\s*给\s*"([^"]*)"$/ do |path, field|
  attach_file(field, File.expand_path(path))
end

Then /^(?:|我)应当看[到|见]\s*JSON:$/ do |expected_json|
  require 'json'
  expected = JSON.pretty_generate(JSON.parse(expected_json))
  actual   = JSON.pretty_generate(JSON.parse(response.body))
  expected.should == actual
end

Then /^(?:|我)应当看[到|见]\s*"([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:|我)应当看[到|见]\s*\/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_xpath('//*', :text => regexp)
  else
    assert page.has_xpath?('//*', :text => regexp)
  end
end

Then /^(?:|我)应当看不[到|见]\s*"([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Then /^(?:|我)应当看不[到|见]\s*\/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_no_xpath('//*', :text => regexp)
  else
    assert page.has_no_xpath?('//*', :text => regexp)
  end
end

Then /^(?:在\s*("[^"]*")\s*里面)?字段\s*"([^"]*)"\s*应当包含\s*"([^"]*)"$/ do |selector, field, value|
  with_scope(selector) do
    field = find_field(field)
    field_value = (field.tag_name == 'textarea') ? field.text : field.value
    if field_value.respond_to? :should
      field_value.should =~ /#{value}/
    else
      assert_match(/#{value}/, field_value)
    end
  end
end

Then /^(?:在\s*("[^"]*")\s*里面)?字段\s*"([^"]*)"\s*应当不包含\s*"([^"]*)"$/ do |selector, field, value|
  with_scope(selector) do
    field = find_field(field)
    field_value = (field.tag_name == 'textarea') ? field.text : field.value
    if field_value.respond_to? :should_not
      field_value.should_not =~ /#{value}/
    else
      assert_no_match(/#{value}/, field_value)
    end
  end
end

Then /^(?:在\s*("[^"]*")\s*里面)?复选框\s*"([^"]*)"\s*应当是勾上的$/ do |selector, label|
  with_scope(selector) do
    field_checked = find_field(label)['checked']
    if field_checked.respond_to? :should
      field_checked.should be_true
    else
      assert field_checked
    end
  end
end

Then /^(?:在\s*("[^"]*")\s*里面)?复选框\s*"([^"]*)"\s*应当不是勾上的$/ do |selector, label|
  with_scope(selector) do
    field_checked = find_field(label)['checked']
    if field_checked.respond_to? :should
      field_checked.should be_false
    else
      assert !field_checked
    end
  end
end

Then /^(?:|我)应当在页面\s*(.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Then /^(?:|我)应当有如下查询字符串:$/ do |expected_pairs|
  query = URI.parse(current_url).query
  actual_params = query ? CGI.parse(query) : {}
  expected_params = {}
  expected_pairs.rows_hash.each_pair{|k,v| expected_params[k] = v.split(',')}

  if actual_params.respond_to? :should
    actual_params.should == expected_params
  else
    assert_equal expected_params, actual_params
  end
end

Then /^显示页面$/ do
  save_and_open_page
end

# Use this step in conjunction with Rail's datetime_select helper. For example:
# When I select "December 25, 2008 10:00" as the date and time
When /^(?:|我)选取\s*"([^"]*)"为日期时间$/ do |time|
  select_datetime(time)
end

# Use this step when using multiple datetime_select helpers on a page or
# you want to specify which datetime to select. Given the following view:
#   <%= f.label :preferred %><br />
#   <%= f.datetime_select :preferred %>
#   <%= f.label :alternative %><br />
#   <%= f.datetime_select :alternative %>
# The following steps would fill out the form:
# When I select "November 23, 2004 11:20" as the "Preferred" date and time
# And I select "November 25, 2004 10:30" as the "Alternative" date and time
When /^(?:|我)选取"([^"]*)"作为\s*"([^"]*)"\s*的日期时间$/ do |datetime, datetime_label|
  select_datetime(datetime, :from => datetime_label)
end

# Use this step in conjunction with Rail's time_select helper. For example:
# When I select "2:20PM" as the time
# Note: Rail's default time helper provides 24-hour time-- not 12 hour time. Webrat
# will convert the 2:20PM to 14:20 and then select it.
When /^(?:|我)选取\s*"([^"]*)"\s*作为时间$/ do |time|
  select_time(time)
end

# Use this step when using multiple time_select helpers on a page or you want to
# specify the name of the time on the form.  For example:
# When I select "7:30AM" as the "Gym" time
When /^(?:|我)选取"([^"]*)"作为\s*"([^"]*)"\s*的时间$/ do |time, time_label|
  select_time(time, :from => time_label)
end

# Use this step in conjunction with Rail's date_select helper.  For example:
# When I select "February 20, 1981" as the date
When /^(?:|我)选取\s*"([^"]*)"\s*作为日期$/ do |date|
  select_date(date)
end

# Use this step when using multiple date_select helpers on one page or
# you want to specify the name of the date on the form. For example:
# When I select "April 26, 1982" as the "Date of Birth" date
When /^(?:|我)选取"([^"]*)"作为\s*"([^"]*)"\s*的日期$/ do |date, date_label|
  select_date(date, :from => date_label)
end

