class User < ActiveRecord::Base
  has_many :reservations, dependent: :destroy
  has_many :rooms, through: :reservations
  has_many :addresses, dependent: :destroy

  validates_presence_of :name
  has_secure_password
  validates_associated :addresses, unless:
    Proc.new { |user| user.provider.present?}

  def addresses_attributes=(addresses_attributes)
    # binding.pry
    addresses_attributes.values.each do |address_attributes|
      # binding.pry
      if address_attributes.keys.include?('id')
        address = self.addresses.find(address_attributes[:id])
        address.update_attributes(address_attributes)
      else
        self.addresses.build(address_attributes)
      end
    end
  end

  def self.from_omniauth(auth)
  binding.pry
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.password = SecureRandom.hex
    end
  end

end
