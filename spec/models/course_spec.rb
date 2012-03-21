require 'spec_helper'

describe Course do
  subject { Factory(:course) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:identifier) }
  it { should validate_uniqueness_of(:identifier) }
  it { should belong_to(:degree_program) }

  it "should factory" do
    course = Factory :course
    assert course.valid?
  end

  it "should find courses based on semester" do
    Factory(:course, :offering_pattern => 1)
    Factory(:course, :offering_pattern => 2)
    Factory(:course, :offering_pattern => 1)
    assert_equal 2, Course.courses_for(:fall, 2011).count
    assert_empty Course.courses_for(:spring, 2011)
  end
end
