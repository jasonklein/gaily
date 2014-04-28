class AddIndexToBookingsForCourseId < ActiveRecord::Migration
  def change
    add_index :bookings, :course_id, unique: true
  end
end
