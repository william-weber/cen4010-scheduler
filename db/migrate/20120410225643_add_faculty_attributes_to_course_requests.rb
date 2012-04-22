class AddFacultyAttributesToCourseRequests < ActiveRecord::Migration
  def up
    add_column :course_requests, :number_of_courses, :integer
    add_column :course_requests, :course_release_expected, :boolean
    add_column :course_requests, :sabbatical_expected, :boolean
    add_column :course_requests, :dev_leave_expected, :boolean
    add_column :course_requests, :course_preference_rank, :integer
    add_column :course_requests, :days_of_week_rank, :integer
    add_column :course_requests, :times_of_day_rank, :integer
    add_column :course_requests, :morning_rank, :integer
    add_column :course_requests, :afternoon_rank, :integer
    add_column :course_requests, :evening_rank, :integer
    add_column :course_requests, :summer_term_preference, :integer
    add_column :course_requests, :days_of_week_preference, :integer

    add_column :course_requests, :type, :string
  end

  def down
    remove_column :course_requests, :number_of_courses
    remove_column :course_requests, :course_release_expected
    remove_column :course_requests, :sabbatical_expected
    remove_column :course_requests, :dev_leave_expected
    remove_column :course_requests, :course_preference_rank
    remove_column :course_requests, :days_of_week_rank
    remove_column :course_requests, :times_of_day_rank
    remove_column :course_requests, :morning_rank
    remove_column :course_requests, :afternoon_rank
    remove_column :course_requests, :evening_rank
    remove_column :course_requests, :summer_term_preference
    remove_column :course_requests, :days_of_week_preference

    remove_column :course_requests, :type
  end
end
