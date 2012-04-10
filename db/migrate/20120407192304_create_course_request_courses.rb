class CreateCourseRequestCourses < ActiveRecord::Migration
  def change
    create_table :course_request_courses do |t|
      t.integer :rank
      t.integer :course_request_id
      t.integer :course_id

      t.timestamps
    end
  end
end
