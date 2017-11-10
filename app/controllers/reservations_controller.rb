class ReservationsController < ApplicationController
  before_action :require_login
  before_action :set_reservation, only: [:edit, :update, :destroy]

  def index
    @reservations = Reservation.users_reservations(current_user)
  end

  def create
    # raise params.inspect
    @reservation = Reservation.new(reservation_params)
    @reservation.checkin_date=(reservation_params[:checkin_date])
    @reservation.checkin_time=(reservation_params[:checkin_time])
    @reservation.checkout_date=(reservation_params[:checkout_date])
    @reservation.checkout_time=(reservation_params[:checkout_time])
    @reservation.convert_to_datetime
    binding.pry

    if @reservation.save
      @reservation.decrease_room_inventory
      redirect_to reservations_path,{notice: "Your reservation " \
        "for the #{@reservation.room_name} has been made, $0 are due today"}
    else
      # binding.pry
      @room_type = RoomType.find(params[:reservation][:room_type_id])
      render :'room_types/show'
    end
  end

  private
  def set_reservation
    @reservation = Reservation.find_by(id: params[:id])
  end


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
