class Restocking < ApplicationRecord
	has_many :sizes, as: :sizeable
	belongs_to :product
	accepts_nested_attributes_for :sizes


	def update_existing_product
		product = self.product
		product.update_attributes(
			price: self.price,
			buying_price: self.buying_price,
			# sizes_attributes: [
			# 	product.sizes.each do |sp|
			# 		self.sizes.each do |sr|
			# 			if sp.size_name == sr.size_name 
			# 				sp.quantity +=  sr.quantity
			# 			else
			# 				sp.size_name = sr.size_name
			# 				sp.quantity = sr.quantity
			# 			end
			# 		end
			# 	end	
			# ]
		)
	end
end
