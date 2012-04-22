require 'spec_helper'

describe CourseReport do
  it { should validate_presence_of(:course) }

  it "should create list of users from course id on create" do
    course = FactoryGirl.create :course
    3.times do |i|
      student = FactoryGirl.create :course_request, :season => 'Summer', :year => 2012
      student.course_request_courses = [ CourseRequestCourse.new(:course => course, :course_request => student, :rank => i, :time => CourseRequestCourse.times[i] ) ]
      student.save!

      faculty = FactoryGirl.create :faculty_course_request, :season => 'Summer', :year => 2012
      faculty.course_request_courses = [ CourseRequestCourse.new(:course => course, :course_request => faculty, :rank => CourseRequestCourse.times[i] ) ]
      faculty.save!
    end

    report = CourseReport.new :course => course, :season => 'Summer', :year => 2012, :user => FactoryGirl.create(:user)
    report.report_users.should be_empty

    report.save!
    report.reload

    report.report_users.length.should == 6
    report.report_users.map(&:time).include?(CourseRequestCourse.times[0]).should be_true
    report.report_users.map(&:time).include?(CourseRequestCourse.times[1]).should be_true
    report.report_users.map(&:time).include?(CourseRequestCourse.times[2]).should be_true
  end
end
