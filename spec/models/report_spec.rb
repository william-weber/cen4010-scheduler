require 'spec_helper'

describe Report do
  it { should have_many(:report_users) }
  it { should have_many(:users) }
  it { should belong_to(:course) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:season) }
  it { should validate_presence_of(:year) }

  it "should know its students and faculty" do
    student = FactoryGirl.create( :user, :is_student => true )
    faculty = FactoryGirl.create( :user, :is_faculty => true, :is_student => false )
    report = CourseReport.new :season => 'Summer', :year => 2012, :user => FactoryGirl.create(:user)
    report.report_users << ReportUser.new(:user => student, :request_type => 'CourseRequest')
    report.report_users << ReportUser.new(:user => student, :request_type => 'CourseRequest')
    report.report_users << ReportUser.new(:user => faculty, :request_type => 'FacultyCourseRequest')

    report.students.should == [ student ]
    report.faculty.should == [ faculty ]
  end

  it "should know its student requests and faculty requests" do
    student = FactoryGirl.create( :user, :is_student => true )
    faculty = FactoryGirl.create( :user, :is_faculty => true, :is_student => false )
    report = CourseReport.new
    report_user1 = ReportUser.new(:user => student, :request_type => 'CourseRequest') 
    report_user2 = ReportUser.new(:user => faculty, :request_type => 'FacultyCourseRequest')
    report.report_users << report_user1 
    report.report_users << report_user2 

    report.student_requests.should == [ report_user1 ]
    report.faculty_requests.should == [ report_user2 ]
  end

  it "should generate summaries of most requested date, time, course" do
    course = FactoryGirl.create :course
    3.times do |i|
      student = FactoryGirl.build :course_request, :season => 'Summer', :year => 2012
      student.course_request_courses = [ CourseRequestCourse.new(:course => course, :course_request => student, :rank => i+1, :time => CourseRequestCourse.times[i], :day => [ 'MWF', 'MW', 'MW'][i] ) ]
      student.save!

      faculty = FactoryGirl.build :faculty_course_request, :season => 'Summer', :year => 2012
      faculty.course_request_courses = [ CourseRequestCourse.new(:course => course, :course_request => faculty, :rank => i+1, :time => [ 'Morning', 'Morning', 'Evening' ][i], :day => [ 'MWF', 'MW', 'MW'][i] ) ]
      faculty.save!
    end

    report = CourseReport.new :course => course, :season => 'Summer', :year => 2012, :user => FactoryGirl.create(:user)

    report.save!

    report.request_counts(:day, :faculty_requests).should == { 'MWF' => 1, 'MW' => 2 }
    report.request_counts(:time, :faculty_requests).should == { 'Morning' => 2, 'Evening' => 1 }

    report.most_requested(:day, :faculty_requests).should == 'MW'
    report.most_requested(:day, :student_requests).should == 'MW'

    report.most_requested(:course, :student_requests).should == course.identifier

    report.most_requested(:time, :student_requests).should include('Morning')
    report.most_requested(:time, :student_requests).should include('Afternoon')
    report.most_requested(:time, :student_requests).should include('Evening')

    report.most_requested(:time, :faculty_requests).should == 'Morning'

    report.average_rank( 'CourseRequest' ).should be_within(0.01).of((1 + 2 + 3) / 3)
    report.average_rank( 'FacultyCourseRequest' ).should be_within(0.01).of((1 + 2 + 3) / 3)

  end
end
