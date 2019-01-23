class Size < ApplicationRecord
	belongs_to :product

	validates :quantity,  presence: true
	validates :size_name, presence: true

 	scope :sort_by_category, ->  { joins(product: :category).order("categories.title ASC,  products.title ASC, sizes.created_at ASC ")}


 	def re_add_in_stock
 		self.quantity += 1
 	end

 	def remove_from_stock
 		self.quantity -= 1
 	end
end
