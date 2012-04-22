class AddSemesterAndYearToReports < ActiveRecord::Migration
  def up
    add_column :reports, :season, :string
    add_column :reports, :year, :integer
    add_column :reports, :user_id, :integer
  end

  def down
    remove_column :reports, :season
    remove_column :reports, :year
    remove_column :reports, :user_id
  end
end
