class AddDogIdToFavorites < ActiveRecord::Migration[7.1]
  def change
    add_column :favorites, :dog_id, :integer
  end
end
