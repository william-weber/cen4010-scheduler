class AddTimeToCourseRequestCourse < ActiveRecord::Migration
  def up
    add_column :course_request_courses, :time, :string
  end

  def down
    remove_column :course_request_courses, :time
  end
end
