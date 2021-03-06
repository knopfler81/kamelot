class BillingAddress < ApplicationRecord

	belongs_to :user

	validates :address_1, presence: true 
	validates :zipcode, presence: true 
	validates :city, presence: :true
	validates :country, presence: true

	def full_name
	  "#{self.first_name} #{self.last_name}"
	end

end
