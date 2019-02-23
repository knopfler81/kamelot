class Restocking < ApplicationRecord
	
	has_many :sizes, as: :sizeable
	belongs_to :product

	validates :price,        presence: true
	validates :buying_price, presence: true

	accepts_nested_attributes_for :sizes


	def update_existing_product
		self.with_lock do 
			product = self.product
			product.update_attributes(
				price: self.price,
				buying_price: self.buying_price,
			)
			sizes = Size.where(sizeable_id: self.product_id)
			self.sizes.each do |restocking_size|
			  if (existing_size = sizes.find{|s| s.size_name == restocking_size.size_name })
			    existing_size.tap{|s| s.quantity += restocking_size.quantity }.save!
			  else
			   	Size.create!(
			   		sizeable_id: self.product_id,
			   		sizeable_type: "Product",
			   		size_name: restocking_size.size_name,
			   		quantity: restocking_size.quantity,
			   	)
			  end
			end
		 end
	end
end
