class Category < ApplicationRecord

	extend FriendlyId
	friendly_id :title, use: :slugged

	has_many :products
	belongs_to :main_category
	has_many :stocks, through: :products
	has_many :sizes, through: :products

	enum gender: [:men, :women, :neutral]

	validates :title, presence: true, uniqueness: { scope: [:main_category_id]}


	def product_with_stock
		self.stocks.map(&:quantity).sum >= 1
	end

end
