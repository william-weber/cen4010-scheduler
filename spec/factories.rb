FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'password123'
    password_confirmation 'password123'
    sequence(:n_number, 1000) {|n| "n0000#{n}" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    degree_program
  end

  factory :degree_program do
    name { Faker::Lorem.sentence(2) } 
  end

  factory :course do
    name { Faker::Lorem.sentence(2) } 
    sequence(:identifier, 1000) {|n| "CEN#{n}" }
    degree_program
  end

  factory :offered_course, :parent => :course do
    name { Faker::Lorem.sentence(2) } 
    sequence(:identifier, 1000) {|n| "CEN#{n}" }
    degree_program
    offered_odd_fall { Forgery::Basic.boolean }
    offered_even_spring { Forgery::Basic.boolean }
    offered_even_fall { Forgery::Basic.boolean }
    offered_odd_spring { Forgery::Basic.boolean }
  end

  factory :course_request_course do
    rank { Random.new.rand(1..3) }
    course
    time { CourseRequestCourse.times.sample }
  end

  factory :course_request do
    season { CourseRequest.seasons.sample }
    year { Random.new.rand(2012..2015) }
    user
    course_request_courses { [ FactoryGirl.build(:course_request_course) ] }
  end
end
