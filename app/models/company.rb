class Company < ApplicationRecord

	validates :admin_name, presence: true
	validates :address_1, presence: true
	validates :city, presence: true
	validates :zipcode, presence: true
	validates :country, presence: true
	validates :phone, presence: true
	validates :email, presence: true
	validates :site_name, presence: true

	INSTANCE_ID =  1

	def self.instance
		company = Company.find_or_create_by(id: INSTANCE_ID)
	end
end
