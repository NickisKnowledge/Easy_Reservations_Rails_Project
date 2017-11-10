class RoomTypesController < ApplicationController
  before_action :set_roomtype

  def show
    flash.now[:alert] = 'You must have a Home Address to make a reservation' if
      current_user && current_user.addresses.blank?

    @amenities = @room_type.hotel_amenities

    @reservation = current_user.reservations.build if current_user
  end

  private
  def set_roomtype
    # raise params.inspect
    @room_type = RoomType.find_by(id: params[:id])
  end
end
