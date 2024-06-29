# db/migrate/YYYYMMDDHHMMSS_create_dogs.rb
class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.text :description
      t.string :photo_url
      t.references :shelter, foreign_key: true

      t.timestamps
    end
  end
end
