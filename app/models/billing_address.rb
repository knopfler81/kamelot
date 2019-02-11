class BillingAddress < ApplicationRecord

	belongs_to :user

	validates :route, presence: true 
	validates :postal_code, presence: true 
	validates :locality, presence: :true

	def full_name
	  "#{self.first_name} #{self.last_name}"
	end

end
