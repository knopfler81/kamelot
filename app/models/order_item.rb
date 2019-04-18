class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :variant
	has_one    :returning_item


	before_save :set_weight


	enum status: { null: 0, refunded: 1 }


	def quantity_sent
		if self.missing_quantity > 0
			self.quantity - self.missing_quantity
		else
			self.quantity
		end
	end

	private

	def set_weight
		self.weight = self.variant.product.weight
	end
end