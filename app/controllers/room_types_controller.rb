class RoomTypesController < ApplicationController
  before_action :set_roomtype

  private
  def set_roomtype
    # raise params.inspect
    @room_type = RoomType.find_by(id: params[:id])
  end
end
