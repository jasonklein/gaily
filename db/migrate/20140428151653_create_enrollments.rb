class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :course
      t.references :person
      t.boolean :paid_deposit, default: false
      t.boolean :pre_work, default: false

      t.timestamps
    end
  end
end
