class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :date_in
      t.date :date_out
      t.references :product, null: false, foreign_key: true
      t.string :comment
      t.references :user, null: false, foreign_key: true
      t.integer :total_price
      t.string :status

      t.timestamps
    end
  end
end
