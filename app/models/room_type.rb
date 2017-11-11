class RoomType < ActiveRecord::Base
  has_many :rooms

  def hotel_amenities
    rooms.first.hotel.amenities
  end

  def room_type_inventory
    rooms.first.inventory
  end
end
