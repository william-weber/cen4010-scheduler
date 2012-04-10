Given /^there is a course named "([^"]*)" that is offered this semester$/ do |arg1|
  FactoryGirl.create :course, :name => arg1, :offered_odd_fall => true, :offered_even_fall => true, :offered_odd_spring => true, :offered_even_spring => true
end

Given /^there is a course named "([^"]*)" that is offered in the fall of even years$/ do |arg1|
  FactoryGirl.create :course, :name => arg1, :offered_even_fall => true
end

Given /^there is a course with identifier (.+)$/ do |arg1|
  FactoryGirl.create :course, :identifier => arg1
end
