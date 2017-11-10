class User < ActiveRecord::Base
  has_many :reservations, dependent: :destroy
  has_many :rooms, through: :reservations
  has_many :addresses, dependent: :destroy

  validates_presence_of :name
  has_secure_password

  def addresses_attributes=(addresses_attributes)
    binding.pry
    addresses_attributes.values.each do |address_attributes|
      binding.pry
      self.addresses.build(address_attributes)
    end
  end
end
