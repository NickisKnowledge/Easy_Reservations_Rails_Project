class Room < ActiveRecord::Base
  belongs_to :room_type
  belongs_to :hotel
end
