class Category < ApplicationRecord
	has_many :products
	has_many :sizes, through: :products

	validates :title, presence: true, uniqueness: true


	def product_with_stock
		self.products.map {|p| p.stocks.map(&:quantity).sum }.sum >= 1 
	end

end
