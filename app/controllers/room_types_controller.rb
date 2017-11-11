class RoomTypesController < ApplicationController
  before_action :set_roomtype

  def show
    result = @room_type.any_alerts?(current_user)
    if result[0]
      flash.now[:alert] = "#{result[1]}"
    end

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
    @room_type = RoomType.find_by(id: params[:id])
  end
end
