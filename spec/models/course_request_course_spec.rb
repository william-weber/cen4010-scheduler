require 'spec_helper'

describe CourseRequestCourse do
  it { should belong_to(:course) }
  it { should belong_to(:course_request) }
  it { should validate_presence_of(:course) }
  it { should validate_presence_of(:rank) }

  it "should have default values for times" do
    assert_equal [ 'Morning', 'Afternoon', 'Evening' ], CourseRequestCourse.times
  end  
end
