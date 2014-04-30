class ChangePreWorkTypeToStringInEnrollments < ActiveRecord::Migration
  def change
    change_column :enrollments, :pre_work, :string, default: "No"
  end
end
