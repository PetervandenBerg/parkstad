class AddUserNameToAttendances < ActiveRecord::Migration
  def change
    add_column :attendances, :user_name, :string
  end
end
