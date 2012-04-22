class DayReport < Report
  validates :day, :presence => true

  def find_requests
    CourseRequest.find_all_by_season_and_year(season, year).each do |request|
      request.course_request_courses.each do |course_request_course|
        report_users << ReportUser.new(:user => course_request_course.course_request.user, :report => self, :time => course_request_course.time, :day => course_request_course.day, :rank => course_request_course.rank, :course => course_request_course.course ) if course_request_course.day == day
      end
    end
  end
end
