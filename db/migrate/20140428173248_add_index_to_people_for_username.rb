class AddIndexToPeopleForUsername < ActiveRecord::Migration
  def change
    add_index :people, :username, :unique => true
  end
end
