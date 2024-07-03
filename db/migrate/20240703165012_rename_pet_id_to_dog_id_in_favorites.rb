class RenamePetIdToDogIdInFavorites < ActiveRecord::Migration[6.1]
  def change
    remove_index :favorites, name: "index_favorites_on_pet_id"
    rename_column :favorites, :pet_id, :dog_id
    add_index :favorites, :dog_id
  end
end
