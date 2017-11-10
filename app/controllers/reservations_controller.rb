class ReservationsController < ApplicationController

  def create
    # raise params.inspect
    @reservation = Reservation.new(reservation_params)
    @reservation.checkin_date=(reservation_params[:checkin_date])
    @reservation.checkin_time=(reservation_params[:checkin_time])
    @reservation.checkout_date=(reservation_params[:checkout_date])
    @reservation.checkout_time=(reservation_params[:checkout_time])
    @reservation.convert_to_datetime
    binding.pry

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
