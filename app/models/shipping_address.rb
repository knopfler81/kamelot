class ShippingAddress < ApplicationRecord
	belongs_to :user
	validates :address_1, presence: true 
	validates :zip_code, presence: true 
	validates :city, presence: :true
end
