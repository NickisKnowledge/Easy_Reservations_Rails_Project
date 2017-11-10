class ReservationsController < ApplicationController

  def create
    raise params.inspect

  end

  private
  def reservation_params
  params.require(:reservation).permit(
    :checkin_date,
    :checkin_time,
    :checkout_date,
    :checkout_time,
    :number_of_rooms,
    :room_id,
    :user_id
  )
  end
end
