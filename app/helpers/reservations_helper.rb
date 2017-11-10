module ReservationsHelper
  def user_view_reservation_date(booking_datetime)
    booking_datetime.to_date.strftime('%A, %B %d, %Y')
  end

  def user_view_reservation_time(booking_datetime)
    booking_datetime.to_time.strftime('%l:%M %P')
  end
end
