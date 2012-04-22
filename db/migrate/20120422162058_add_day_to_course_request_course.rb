class AddDayToCourseRequestCourse < ActiveRecord::Migration
  def up
    add_column :course_request_courses, :day, :string
  end

  def down
    remove_column :course_request_courses, :day
  end
end
