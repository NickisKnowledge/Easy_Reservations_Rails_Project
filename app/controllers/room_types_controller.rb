class RoomTypesController < ApplicationController
  before_action :set_roomtype

  def show
    flash.now[:alert] = 'You must have a Home Address to make a reservation' if
      current_user && current_user.addresses.blank?
    flash.now[:alert] = "Only 1 #{@room_type.name} is available." \
      ' Reserve NOW to make it yours!!!' if @room_type.room_type_inventory == 1
    flash.now[:alert] = "Sorry, no #{@room_type.name} rooms are available." if
      @room_type.room_type_inventory == 0

    @amenities = @room_type.hotel_amenities

    @reservation = current_user.reservations.build(
      room_id: params[:room_id],
      checkin_date: Reservation.default_checkin_date,
      checkin_time: Reservation.default_checkin_time,
      checkout_date: Reservation.default_checkout_date,
      checkout_time: Reservation.default_checkout_time
      ) if current_user
  end

  private
  def set_roomtype
    # raise params.inspect
    @room_type = RoomType.find_by(id: params[:id])
  end
end
