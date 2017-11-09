class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :amenities
      t.string :photo

      t.timestamps null: false
    end
  end
end
