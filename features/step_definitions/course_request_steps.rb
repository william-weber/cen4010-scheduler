Given /^(.+) has requested (.+) in the (.+) for (.+) (\d+)$/ do |n_number, identifier, time, season, year|
  request = FactoryGirl.build :course_request, :user => User.find_by_n_number(n_number), :season => season.capitalize, :year => year
  request.course_request_courses << FactoryGirl.build(:course_request_course, :course => Course.find_by_identifier(identifier), :time => time.capitalize)
  request.save!
end
