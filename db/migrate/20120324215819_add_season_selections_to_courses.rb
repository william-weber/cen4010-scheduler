class AddSeasonSelectionsToCourses < ActiveRecord::Migration
  def up
    add_column :courses, :offered_odd_fall, :boolean
    add_column :courses, :offered_even_spring, :boolean
    add_column :courses, :offered_even_fall, :boolean
    add_column :courses, :offered_odd_spring, :boolean
    remove_column :courses, :offering_pattern
  end

  def down
    add_column :courses, :offering_pattern, :integer
    remove_column :courses, :offered_odd_fall
    remove_column :courses, :offered_even_spring
    remove_column :courses, :offered_even_fall
    remove_column :courses, :offered_odd_spring
  end
end
