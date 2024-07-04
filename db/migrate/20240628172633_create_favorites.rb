class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id, null: false
      t.integer :dog_id, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      
      t.timestamps
    end

    add_index :favorites, :user_id
    add_index :favorites, :dog_id
  end
end
