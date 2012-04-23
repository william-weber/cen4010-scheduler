class StudentReport < Report
  def find_requests
    CourseRequest.find_all_by_season_and_year(season, year).each do |request|
      request.course_request_courses.each do |course_request_course|
        report_users << ReportUser.copy(self, course_request_course) if course_request_course.course_request.user.is_student
      end
    end
  end
end
