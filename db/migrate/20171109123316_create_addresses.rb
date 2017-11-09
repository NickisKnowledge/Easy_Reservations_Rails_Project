class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :address_type
      t.references :user, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
