Given /^there is a course named "([^"]*)" that is offered this semester$/ do |arg1|
  Factory :course, :name => arg1, :offered_odd_fall => true, :offered_even_fall => true, :offered_odd_spring => true, :offered_even_spring => true
end

Given /^there is a course named "([^"]*)" that is offered in the fall of even years$/ do |arg1|
  Factory :course, :name => arg1, :offered_even_fall => true
end

When /^I go to the course listing page$/ do
  visit courses_path
end
