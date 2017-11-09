class RoomsController < ApplicationController
  def show
    @rooms = Room.hotel_rooms(params[:id])
  end
end
