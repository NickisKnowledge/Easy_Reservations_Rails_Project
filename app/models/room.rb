class Room < ActiveRecord::Base
  belongs_to :room_type
  belongs_to :hotel
  has_many :reservations
  has_many :users, through: :reservations

end
