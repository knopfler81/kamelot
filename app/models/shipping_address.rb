class ShippingAddress < ApplicationRecord
	belongs_to :user
	
	validates :address_1, presence: true 
	validates :zipcode, format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "Entrez un code postal valide" } #french zipcode
	validates :phone, format:  { with: /\A(33|0)(1|2|3|4|5|6|7|9)\d{8}\z/,  message: "Entrez un numéro de téléphone valide" } #french phone number 
	validates :city, presence: :true
	

	validate :valid_country

	def full_name
	  "#{self.first_name} #{self.last_name}"
	end

	def valid_country
		if  self.country != "FR"
			errors.add(:base, :invalid_country)
		end
	end
end
