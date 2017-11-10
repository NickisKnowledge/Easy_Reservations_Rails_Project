class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  attr_accessor :checkin_date, :checkin_time, :checkout_date, :checkout_time

  validates_presence_of :checkin_date
  validates_presence_of :checkin_time
  validates_presence_of :checkout_date
  validates_presence_of :checkout_time
  validates_presence_of :number_of_rooms

  validate :future_checkin_date
  validate :future_checkin_time
  validate :future_checkout_date
  validate :future_checkout_time
  validate :no_of_rooms_greater_then_0, if: lambda { number_of_rooms.present? }

  def future_checkin_date
    # binding.pry
    if checkin_date.present? && checkin_date.to_date < DateTime.now.to_date
      errors.add(:checkin_date, 'must be a valid current or future date')
    end
  end

  def future_checkin_time
    # binding.pry
    if checkin_time.present? && checkin_time.to_time < Time.now
      errors.add(:checkin_time, 'must be a valid current or future time')
    end
  end

  def future_checkout_date
    # binding.pry
    if checkin_date.present? && checkout_date.present? &&
        checkout_date.to_date < checkin_date.to_date
      errors.add(:checkout_date, 'must be a valid date after your check in ' \
        'date')
    end
  end

  def future_checkout_time
    # binding.pry
    if checkin_datetime.present? && checkout_datetime.present? &&
        checkout_datetime <= checkin_datetime
        errors.add(:checkout_time, 'must be a valid time after your check in ' \
        'time.')
    end
  end

  def no_of_rooms_greater_then_0
    errors.add(:number_of_rooms, 'must be 1 or more to make a reservation') if
      number_of_rooms <= 0
  end

  def convert_to_datetime
    # binding.pry
    if self.checkin_date.present? && self.checkin_time.present?
      self.checkin_datetime =  self.merge_datetime(
        self.checkin_date,
        self.checkin_time
      )
    end
    if self.checkout_date.present? && self.checkout_time.present?
      self.checkout_datetime = self.merge_datetime(
        self.checkout_date,
        self.checkout_time
      )
    end
  end

  def merge_datetime(date1, time1)
    # binding.pry
    res_date = Date.parse(date1)
    res_time = Time.parse(time1)
    merged_datetime = DateTime.new(
      res_date.year,
      res_date.month,
      res_date.day,
      res_time.hour,
      res_time.min,
      res_time.sec
    )
  end

  def room_name
    room.room_type.name
  end

  def decrease_room_inventory
  # binding.pry
  room.update(inventory: (room.inventory -= number_of_rooms))
  end

  def self.default_checkin_date
    DateTime.now.strftime('%Y-%m-%d')
  end

  def self.default_checkin_time
    (DateTime.now.midday + 3.hours).strftime('%H:%M')
  end

  def self.default_checkout_date
    DateTime.tomorrow.strftime('%Y-%m-%d')
  end

  def self.default_checkout_time
    (DateTime.tomorrow.midday).strftime('%H:%M')
  end

  def self.users_reservations(user)
    where('user_id = ?', user)
  end

  def reservation_date(booking_datetime)
    booking_datetime.strftime('%Y-%m-%d')
  end

  def reservation_time(booking_datetime)
    booking_datetime.strftime('%H:%M')
  end

  def self.reservations_checkin_setter(reservations)
    reservations.each do |reservation|
      reservation.checkin_date = reservation.reservation_date(
        reservation.checkin_datetime
      )
      reservation.checkin_time = reservation.reservation_time(
        reservation.checkin_datetime
      )
    end
  end

  def self.reservations_checkout_setter(reservations)
    reservations.each do |reservation|
      reservation.checkout_date = reservation.reservation_date(
        reservation.checkout_datetime
      )
      reservation.checkout_time = reservation.reservation_time(
        reservation.checkout_datetime
      )
    end
  end

end
