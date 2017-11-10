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
end
