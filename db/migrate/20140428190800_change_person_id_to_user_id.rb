class ChangePersonIdToUserId < ActiveRecord::Migration
  def change
    rename_column :assignments, :person_id, :user_id
    rename_column :enrollments, :person_id, :user_id
  end
end
