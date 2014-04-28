class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :username, null: false, unique: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :role, null: false, default: :guest

      t.timestamps
    end
  end
end
