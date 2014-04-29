class ChangeUserIdToStudentIDandInstructorIDinJoinTables < ActiveRecord::Migration
  def change
    rename_column :assignments, :user_id, :instructor_id
    rename_column :enrollments, :user_id, :student_id
  end
end
