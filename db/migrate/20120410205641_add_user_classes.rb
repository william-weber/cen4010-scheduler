class AddUserClasses < ActiveRecord::Migration
  def up
    add_column :users, :is_student, :boolean, :default => true
    add_column :users, :is_faculty, :boolean, :default => false
    add_column :users, :is_admin, :boolean, :default => false
    add_column :users, :is_secretary, :boolean, :default => false
  end

  def down
    remove_column :users, :is_student
    remove_column :users, :is_faculty
    remove_column :users, :is_admin
    remove_column :users, :is_secretary
  end
end
