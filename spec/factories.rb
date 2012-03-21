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
    offering_pattern { 1 + Random.rand(4) }
  end
end
