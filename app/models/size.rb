class Size < ApplicationRecord
	belongs_to :product

	has_many :order_items, inverse_of: :size, dependent: :destroy
	has_many :sale_items, inverse_of: :size, dependent: :destroy

	validates :quantity,  presence: true
	validates :size_name, presence: true
  
 	scope :sort_by_category, ->  { joins(product: :category).order("categories.title ASC,  products.title ASC, sizes.created_at ASC ")}
 	scope :available, -> { where('sizes.quantity > ?',  "0")}

 	before_create :quantity_on_create 
 	before_update :quantity_on_update
	#audited

 	def re_add_in_stock
 		self.quantity += 1
 	end

 	def remove_from_stock
 		self.quantity -= 1
 	end

 	private 
 	
 	def quantity_on_create
 	  self.quantity_stock = self.quantity
 	end

 	def quantity_on_update
 	   self.quantity_stock += self.quantity
 	end
end
