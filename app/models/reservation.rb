class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :room

  attr_accessor :checkin_date, :checkin_time, :checkout_date, :checkout_time

end
