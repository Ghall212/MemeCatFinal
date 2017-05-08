class AddProfilePicToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :profile_pic, :string, :default => "Default.jpg"
  end
end
