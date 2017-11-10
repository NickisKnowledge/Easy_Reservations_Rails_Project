class ReservationsController < ApplicationController

  def create
    # raise params.inspect
    @reservation = Reservation.new(reservation_params)
    @reservation.checkin_date=(reservation_params[:checkin_date])
    @reservation.checkin_time=(reservation_params[:checkin_time])
    @reservation.checkout_date=(reservation_params[:checkout_date])
    @reservation.checkout_time=(reservation_params[:checkout_time])
    @reservation.convert_to_datetime

    if @reservation.save
      @reservation.decrease_room_inventory
      redirect_to reservations_path,{notice: "Your reservation " \
        "for the #{@reservation.room_name} has been made, $0 are due today"}
    else
      # binding.pry
      render :'room_types/show'
    end
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
