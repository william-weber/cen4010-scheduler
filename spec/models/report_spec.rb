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
    report.report_users << ReportUser.new(:user => student)
    report.report_users << ReportUser.new(:user => student)
    report.report_users << ReportUser.new(:user => faculty)

    report.students.should == [ student ]
    report.faculty.should == [ faculty ]
  end

  it "should know its student requests and faculty requests" do
    student = FactoryGirl.create( :user, :is_student => true )
    faculty = FactoryGirl.create( :user, :is_faculty => true, :is_student => false )
    report = CourseReport.new
    report_user1 = ReportUser.new(:user => student) 
    report_user2 = ReportUser.new(:user => faculty) 
    report.report_users << report_user1 
    report.report_users << report_user2 

    report.student_requests.should == [ report_user1 ]
    report.faculty_requests.should == [ report_user2 ]
  end
end
