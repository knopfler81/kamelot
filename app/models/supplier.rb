class Supplier < ApplicationRecord
	has_many :products
	has_many :stocks

	validates :company, presence: true
	validates :address, presence: true	
	validates :city,    presence: true
	validates :zipcode, presence: true
end

