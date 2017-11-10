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
    checkin_datetime =  merge_datetime(checkin_date, checkin_time) if
      checkin_date.present? && checkin_time.present?
    # binding.pry
    checkout_datetime = merge_datetime(checkout_date, checkout_time) if
      checkout_date.present? && checkout_time.present?
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

end
