class CreateDegreePrograms < ActiveRecord::Migration
  def change
    create_table :degree_programs do |t|
      t.string :name

      t.timestamps
    end
  end
end
