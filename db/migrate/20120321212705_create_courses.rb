class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :identifier
      t.references :degree_program
      t.integer :offering_pattern

      t.timestamps
    end
  end
end
