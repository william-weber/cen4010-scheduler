class AddRequestTypeToRequestUsers < ActiveRecord::Migration
  def up
    add_column :report_users, :request_type, :string
  end

  def down
    remove_column :report_users, :request_type
  end
end
