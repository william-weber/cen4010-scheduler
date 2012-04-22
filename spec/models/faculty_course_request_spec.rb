require 'spec_helper'

describe FacultyCourseRequest do
  it { should belong_to(:user) }
  it { should validate_presence_of(:user) }

  it { should have_many(:course_request_courses) }
  it { should have_many(:courses) }

  it { should validate_presence_of(:season) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:course_preference_rank) }
  it { should ensure_inclusion_of(:course_preference_rank).in_range(1..3) }
  it { should validate_presence_of(:days_of_week_rank) }
  it { should ensure_inclusion_of(:days_of_week_rank).in_range(1..3) }
  it { should validate_presence_of(:times_of_day_rank) }
  it { should ensure_inclusion_of(:times_of_day_rank).in_range(1..3) }
  it { should validate_presence_of(:morning_rank) }
  it { should ensure_inclusion_of(:morning_rank).in_range(1..3) }
  it { should validate_presence_of(:afternoon_rank) }
  it { should ensure_inclusion_of(:afternoon_rank).in_range(1..3) }
  it { should validate_presence_of(:evening_rank) }
  it { should ensure_inclusion_of(:evening_rank).in_range(1..3) }
  
  it "should factory" do
    FactoryGirl.create(:faculty_course_request).should be_valid
  end

  it "should know the names of summer terms" do
    assert_equal [ 'Summer C', 'Summer A', 'Summer B', '8 week', '12 week' ], FacultyCourseRequest.summer_terms
  end

  it "should know the summer day of week options" do
    assert_equal [ 'MW', 'TR', 'MTWR', 'MWF', 'MW + 4 Fridays', 'TR + 4 Fridays' ], FacultyCourseRequest.summer_days
  end

  it "should know the fall and spring day of week options" do
    assert_equal [ 'MWF', 'MW', 'TR' ], FacultyCourseRequest.fall_spring_days
  end

  it "should not allow values for course release, sabbatical, or dev leave for summer requests" do
    request = FactoryGirl.create :faculty_course_request, :season => CourseRequest.seasons[1] 

    request.sabbatical_expected = true
    request.should_not be_valid
    
    request.sabbatical_expected = false
    request.should be_valid

    request.course_release_expected = true
    request.should_not be_valid

    request.course_release_expected = false
    request.should be_valid

    request.dev_leave_expected = true
    request.should_not be_valid
  end

  it "should validate days of week preference according to term selected" do
    spring = FactoryGirl.create :faculty_course_request, :season => CourseRequest.seasons[0]
    summer = FactoryGirl.create :faculty_course_request, :season => CourseRequest.seasons[1]
    fall = FactoryGirl.create :faculty_course_request, :season => CourseRequest.seasons[2]

    summer.days_of_week_preference = 4
    summer.should be_valid

    spring.days_of_week_preference = 0
    spring.should be_valid

    spring.days_of_week_preference = 20
    spring.should_not be_valid
    
    spring.days_of_week_preference = 3
    spring.should_not be_valid

    fall.days_of_week_preference = 3
    fall.should_not be_valid
  end

  it "should know if it is a summer request or not" do
    request = FactoryGirl.create :faculty_course_request, :season => CourseRequest.seasons[1]

    request.for_summer?.should be_true

    request.season = CourseRequest.seasons[2]
    request.for_summer?.should be_false
  end

  it "should not allow value for summer term preference if not a summer request" do
    request = FactoryGirl.create :faculty_course_request, :season => CourseRequest.seasons[1]
    request.summer_term_preference = 0

    request.should be_valid

    request.summer_term_preference = 5
    request.should_not be_valid

    request.season = CourseRequest.seasons[0]
    request.should_not be_valid
  end
  
  it "should validate uniquess of rank selections" do
    request = FactoryGirl.create :faculty_course_request

    request.course_preference_rank = 0
    request.should_not be_valid

    request.course_preference_rank = 1
    request.days_of_week_rank = 1
    request.times_of_day_rank = 1
    request.should_not be_valid

    request.times_of_day_rank = 3
    request.should_not be_valid
    request.days_of_week_rank = 2
    request.should be_valid
  end
end
