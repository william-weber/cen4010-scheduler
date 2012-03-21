class ChangeUserNNumberToString < ActiveRecord::Migration
  def up
    remove_column :users, :n_number
    add_column :users, :n_number, :string
    add_index  :users, :n_number, :unique => true
  end

  def down
    remove_index :users, :n_number
    remove_column :users, :n_number
    add_column :usrs, :n_number, :integer
  end
end
