class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :variant
	has_one    :returning_item


	before_save :set_weight


	private

	def set_weight
		self.weight = self.variant.product.weight
	end
end