class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name, null: false, unique: true
      t.text :equipment
      t.text :other_aspects

      t.timestamps
    end
  end
end
