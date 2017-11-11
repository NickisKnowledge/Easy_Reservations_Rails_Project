class Address < ActiveRecord::Base
  belongs_to :user

  with_options if: :home_address_present? do |address|
  address.validates :street_1,
    presence: { message: 'for home address must be provided' }
  address.validates  :city,
    presence: { message: 'for home address must be provided' }
  address.validates  :state,
    presence: { message: 'for home address must be provided' }
  address.validates  :zipcode,
    presence: { message: 'for home address must be provided' }
  address.validates :zipcode,
    presence: {message: 'can only contain integers'}
  end

  def home_address_present?
    address_type == 'Home'
  end

  def self.remove_empty_addresses(user)
    addresses = where('user_id = ?', user)
    addresses.each do |address|
      address.delete if address.street_1.blank? && address.city.blank? &&
        address.state.blank? && address.zipcode.blank?
    end
    addresses
  end

  def work_address_issues?
    attributes = self.attributes.except('id', 'created_at', 'updated_at')
    case
    when !attributes['zipcode'].is_a?(Integer)
      return true, 'Your Work Address zip code did not consist of integers, ' \
      'therefore it has not been added to your profle'
    when attributes.values.any?(&:blank?)
      return true, 'Your Work Address was incomplete, therefore it has not ' \
        'been added to your profle'
    else
      [false]
    end
  end
end
