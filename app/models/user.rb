class User < ActiveRecord::Base
  has_many :reservations, dependent: :destroy
  has_many :rooms, through: :reservations
  has_many :addresses, dependent: :destroy

  validates_presence_of :name
  has_secure_password
end
