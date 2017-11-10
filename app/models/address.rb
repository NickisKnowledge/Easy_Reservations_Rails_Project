class Address < ActiveRecord::Base
  belongs_to :user

  with_options if: :home_address_present? do |address|
  #  binding.pry
  address.validates :street_1,
    :presence => { message: 'for home address must be provided' }
  address.validates  :city,
    :presence => { message: 'for home address must be provided' }
  address.validates  :state,
    :presence => { message: 'for home address must be provided' }
  address.validates  :zipcode,
    :presence => { message: 'for home address must be provided' }
  address.validates :zipcode,
    :numericality => {message: 'can only contain integers'}
  end

  def home_address_present?
    # binding.pry
    self.address_type == 'Home'
  end

  def self.remove_empty_addresses(user)
    #  binding.pry
    addresses = where('user_id = ?', user)
    addresses.each do |address|
      address.delete if address.street_1.blank? && address.city.blank? &&
        address.state.blank? && address.zipcode.blank?
    end
    addresses
  end
end
