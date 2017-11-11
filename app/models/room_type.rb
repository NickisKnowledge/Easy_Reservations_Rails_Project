class RoomType < ActiveRecord::Base
  has_many :rooms

  def hotel_amenities
    rooms.first.hotel.amenities
  end

  def room_type_inventory
    rooms.first.inventory
  end

  def any_alerts?(user)
    if user && user.addresses.blank?
      message = 'You must have a Home Address to make a reservation'
      return true, message
    elsif self.room_type_inventory == 1
      message = "Only 1 #{self.name} is available. Reserve NOW to make " \
        'it yours!!!'
      return true, message
    elsif self.room_type_inventory == 0
      message = "Sorry, no #{self.name} rooms are available."
      return true, message
    else
      [false]
    end
  end
end
