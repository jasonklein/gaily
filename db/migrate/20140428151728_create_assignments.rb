class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :course
      t.references :person
      t.integer :contract_fee, null: false
      t.string :position, null: false

      t.timestamps
    end
  end
end
