class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :variant


	before_save :set_weight


	private

	def set_weight
		self.weight = self.variant.product.weight
	end
end