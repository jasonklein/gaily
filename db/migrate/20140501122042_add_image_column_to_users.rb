class AddImageColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :string, default: "https://s3-eu-west-1.amazonaws.com/wdi-london-gaily-app/default-profile-image/GeneralAssemblylogo.jpg"
  end
end
