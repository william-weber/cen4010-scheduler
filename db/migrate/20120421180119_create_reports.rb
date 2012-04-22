class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :type
      t.datetime :date_run
      t.references :course
      t.string :day
      t.string :time

      t.timestamps
    end

    create_table :report_users do |t|
      t.references :user
      t.string :day
      t.string :time
      t.integer :rank
      t.references :report
      t.references :course
    end
  end
end
