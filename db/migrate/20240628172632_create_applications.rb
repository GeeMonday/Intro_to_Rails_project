class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :dog, null: false, foreign_key: true
      t.string :status, null: false
      t.datetime :submitted_at, null: false

      t.timestamps
    end
  end
end
