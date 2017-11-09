class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :room_rate
      t.integer :inventory
      t.references :room_type, index: true, foreign_key: true
      t.references :hotel, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
