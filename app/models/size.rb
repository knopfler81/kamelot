class Size < ApplicationRecord
	belongs_to :product
	has_many :order_items, inverse_of: :size, dependent: :destroy
	has_many :sale_items, inverse_of: :size, dependent: :destroy

	validates :quantity,  presence: true
	validates :size_name, presence: true
  
 	scope :sort_by_category, ->  { joins(product: :category).order("categories.title ASC,  products.title ASC, sizes.created_at ASC ")}

 	scope :available, -> { where('sizes.quantity > ?',  "0")}

 	def re_add_in_stock
 		self.quantity += 1
 	end

 	def remove_from_stock
 		self.quantity -= 1
 	end
end
