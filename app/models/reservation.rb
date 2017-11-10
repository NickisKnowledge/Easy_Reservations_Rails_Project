class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  attr_accessor :checkin_date, :checkin_time, :checkout_date, :checkout_time

  def convert_to_datetime
    binding.pry
    self.checkin_datetime =  self.merge_datetime(
      self.checkin_date,
      self.checkin_time
    )

    binding.pry
    self.checkout_datetime = self.merge_datetime(
    self.checkout_date,
    self.checkout_time
    )
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
end
