Then /^I should see "([^"]*)" on the page$/ do |arg1|
  page.should have_content arg1
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"?$/ do |value, field|
  select(value, :from => field)
end

Then /^I press "([^"]*)"$/ do |arg1|
  click_button arg1
end
