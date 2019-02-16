class Size < ApplicationRecord
	belongs_to :product
	has_one :order_item, dependent: :destroy

	validates :quantity,  presence: true
	validates :size_name, presence: true

	#before_validation :initial_quantity
  
 	scope :sort_by_category, ->  { joins(product: :category).order("categories.title ASC,  products.title ASC, sizes.created_at ASC ")}

 	scope :available, -> { where('sizes.quantity > ?',  "0")}

 	def re_add_in_stock
 		self.quantity += 1
 	end

 	def remove_from_stock
 		self.quantity -= 1
 	end

	# def initial_quantity
	# 	self.quantity_stock += self.quantity
	# end

end
