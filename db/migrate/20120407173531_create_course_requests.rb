class CreateCourseRequests < ActiveRecord::Migration
  def change
    create_table :course_requests do |t|
      t.string :season
      t.integer :year
      t.references :user

      t.timestamps
    end
  end
end
