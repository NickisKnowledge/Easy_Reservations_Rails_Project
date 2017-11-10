module ReservationsHelper
  def user_view_reservation_date(booking_datetime)
    booking_datetime.to_date.strftime('%A, %B %d, %Y')
  end

  def user_view_reservation_time(booking_datetime)
    booking_datetime.to_time.strftime('%l:%M %P')
  end

  def total_nights(res)
    (res.checkout_datetime.to_date - res.checkin_datetime.to_date).to_i
  end

  def total_price(res)
    nights = total_nights(res) == 0? 1 : total_nights(res)
    cost = nights * res.room.room_rate * res.number_of_rooms
    taxes = cost * 0.15
    number_to_currency(cost + taxes)
  end
end
