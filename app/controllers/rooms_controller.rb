class RoomsController < ApplicationController
  def show
    @rooms = Room.hotel_rooms(params[:id])
    (@rooms.present?) ? (render :'show') : (redirect_to root_path,
      {alert: "Sorry, couldn't find that Hotel, please select from below"})
  end
end
