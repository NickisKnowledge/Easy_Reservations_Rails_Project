class RoomTypesController < ApplicationController
  before_action :set_roomtype

  def show
    @amenities = @room_type.hotel_amenities
  end
  
  private
  def set_roomtype
    # raise params.inspect
    @room_type = RoomType.find_by(id: params[:id])
  end
end
