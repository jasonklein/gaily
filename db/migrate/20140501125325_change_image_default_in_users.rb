class ChangeImageDefaultInUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :image, "/default-profile-image/GeneralAssemblylogo.jpg"
  end
end
