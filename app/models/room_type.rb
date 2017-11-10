class RoomType < ActiveRecord::Base
  has_many :rooms

  def hotel_amenities
    rooms.first.hotel.amenities
  end
end
