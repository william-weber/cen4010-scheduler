class ReportUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :report
  belongs_to :course

  def self.copy_from_request(report, course_request_course)
    ReportUser.new(:user => course_request_course.course_request.user, :report => report, :time => course_request_course.time, :day => course_request_course.day, :rank => course_request_course.rank, :course => course_request_course.course, :request_type => course_request_course.course_request.class.to_s )
  end
end
