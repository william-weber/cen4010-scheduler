require 'spec_helper'

describe Course do
  subject { FactoryGirl.create(:course) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:identifier) }
  it { should validate_uniqueness_of(:identifier) }
  it { should belong_to(:degree_program) }

  it "should factory" do
    course = FactoryGirl.create :course
    assert course.valid?
  end

  it "should find courses based on semester" do
    FactoryGirl.create( :course, :offered_odd_fall => true )
    FactoryGirl.create( :course, :offered_odd_fall => true )
    FactoryGirl.create( :course, :offered_even_fall => true )
    assert_equal 2, Course.courses_for( [ :fall, 2011 ] ).count
    assert_empty Course.courses_for( [ :spring, 2011 ] )
  end

  it "should know the parameters of a semester based on date" do
    assert_equal [ :fall, 2011 ], Course.semester_for( Date.parse( "11-11-2011" ) )
    assert_equal [ :spring, 2012 ], Course.semester_for( Date.parse( "11-02-2012" ) )
  end

  it "should know its full name" do
    course = FactoryGirl.create :course
    assert_equal "#{course.identifier} #{course.name}", course.full_name
  end
end
