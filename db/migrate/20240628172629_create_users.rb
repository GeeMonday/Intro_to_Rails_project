class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :new_username
      t.text :bio
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
