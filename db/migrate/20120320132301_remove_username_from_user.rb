class RemoveUsernameFromUser < ActiveRecord::Migration
  def up
    remove_index  :users, :username
    remove_column :users, :username 
  end

  def down
    add_column :users, :username, :string
    add_index  :users, :username,             :unique => true
  end
end
