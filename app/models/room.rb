class Room < ActiveRecord::Base
  belongs_to :room_type
  belongs_to :hotel
  has_many :reservations
  has_many :users, through: :reservations

  def self.hotel_rooms(id)
    where('hotel_id = ?', id)
  end
end
