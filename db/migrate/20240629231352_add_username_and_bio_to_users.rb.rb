class AddUsernameAndBioToUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :username, :new_username
    add_column :users, :bio, :text
  end
end

