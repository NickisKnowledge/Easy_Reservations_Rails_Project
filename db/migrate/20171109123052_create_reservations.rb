class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :room, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :number_of_rooms, default: 1
      t.datetime :checkin_datetime
      t.datetime :checkout_datetime
      
      t.timestamps null: false
    end
  end
end
