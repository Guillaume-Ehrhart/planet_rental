class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :galaxy
      t.string :system
      t.integer :price_per_night
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.float :distance_from_sun

      t.timestamps
    end
  end
end
