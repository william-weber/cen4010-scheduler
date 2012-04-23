require 'spec_helper'

describe ReportUser do
  it { should belong_to(:user) }
  it { should belong_to(:report) }
  it { should belong_to(:course) }

  it "should copy its data from a course_request_course object" do
    course = FactoryGirl.create :course
    student = FactoryGirl.create :course_request, :season => 'Summer', :year => 2012
    student.course_request_courses = [ CourseRequestCourse.new(:course => course, :course_request => student, :rank => 1, :time => CourseRequestCourse.times[1] ) ]
    student.save!

    report = CourseReport.new :course => course, :season => 'Summer', :year => 2012, :user => FactoryGirl.create(:user)

    copy = ReportUser.copy_from_request(report, student.course_request_courses.first)

    copy.user.should == student.user
    copy.report.should == report
    copy.time.should == student.course_request_courses.first.time
    copy.day.should == student.course_request_courses.first.day
    copy.rank.should == student.course_request_courses.first.rank
    copy.course.should == student.course_request_courses.first.course
    copy.request_type.should == student.class.to_s
  end
end
