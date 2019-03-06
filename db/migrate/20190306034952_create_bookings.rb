class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.boolean :payed
      t.references :service, foreign_key: true
      t.references :user, foreign_key: true
      t.references :billing, foreign_key: true

      t.timestamps
    end
  end
end
