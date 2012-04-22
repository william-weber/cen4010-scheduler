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

    factory :faculty_course_request, :class => FacultyCourseRequest do
      number_of_courses { course_request_courses.count }
      days_of_week_preference { for_summer? ? Random.new.rand(0..FacultyCourseRequest.summer_days.length-1) : Random.new.rand(0..FacultyCourseRequest.fall_spring_days.length-1) }
      summer_term_preference { for_summer? ? Random.new.rand(0..FacultyCourseRequest.summer_terms.length-1) : nil } 
      course_preference_rank 1
      days_of_week_rank 2
      times_of_day_rank 3
      morning_rank 1
      afternoon_rank 2
      evening_rank 3
    end
  end
end
