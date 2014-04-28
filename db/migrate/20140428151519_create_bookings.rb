class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :course
      t.references :classroom
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
  end
end
