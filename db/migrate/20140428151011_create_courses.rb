class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false, unique: true
      t.text :description
      t.string :start_time, null: false
      t.string :end_time, null: false

      t.timestamps
    end
  end
end
