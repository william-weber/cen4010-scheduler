class DayReport < Report
  validates :day, :presence => true

  def find_requests
    CourseRequest.find_all_by_season_and_year(season, year).each do |request|
      request.course_request_courses.each do |course_request_course|
        report_users << ReportUser.copy_from_request(self, course_request_course) if course_request_course.day == day
      end
    end
  end
end
