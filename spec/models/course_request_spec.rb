require 'spec_helper'

describe CourseRequest do
  subject { FactoryGirl.create :course_request }
  it { should belong_to(:user) }
  it { should have_many(:courses) }
  it { should have_many(:course_request_courses) }
  it { should validate_presence_of(:user) }

  it "should have default values for seasons" do
    assert_equal [ 'Spring', 'Summer', 'Fall' ], CourseRequest.seasons
  end  

  it { should be_valid }

  it 'should have at least one course and no more than 3 courses' do
    request = FactoryGirl.build :course_request
    request.should be_valid

    request.course_request_courses = []
    request.should_not be_valid

    CourseRequestCourse.any_instance.stub(:valid?).and_return(true)
    request.course_request_courses << CourseRequestCourse.new
    request.should be_valid

    request.course_request_courses << CourseRequestCourse.new
    request.course_request_courses << CourseRequestCourse.new
    request.should be_valid

    request.course_request_courses << CourseRequestCourse.new
    request.should_not be_valid
  end

  it "should be unique for each user, season and year" do
    request = FactoryGirl.create :course_request, :season => CourseRequest.seasons.first, :year => 2012
    CourseRequestCourse.any_instance.stub(:valid?).and_return(true)
    User.any_instance.stub(:valid?).and_return(true)
    duplicate_1 = request.dup
    duplicate_1.course_request_courses << CourseRequestCourse.new
    duplicate_2 = request.dup
    duplicate_2.course_request_courses << CourseRequestCourse.new
    duplicate_3 = request.dup
    duplicate_3.course_request_courses << CourseRequestCourse.new
    
    duplicate_1.should_not be_valid
    duplicate_2.should_not be_valid
    duplicate_3.should_not be_valid

    duplicate_1.season = CourseRequest.seasons.second
    duplicate_1.should be_valid

    duplicate_2.year = 2013
    duplicate_2.should be_valid

    duplicate_3.user = User.create!
    duplicate_3.should be_valid
  end
end
