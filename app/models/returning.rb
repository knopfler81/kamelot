class Returning < ApplicationRecord
	belongs_to :order
	belongs_to :user
	has_many   :items, class_name: "ReturningItem", dependent: :destroy


	after_create :set_returning_items

	enum status: { pending: 0, confirmed: 1, refunded: 2 }

	def set_returning_items

		order = self.order

		order.items.each do |item|
			ReturningItem.create!(
				returning_id: self.id,
				order_item_id: item.id,
				price: item.price
				)
		end
	end


	def total_refund
		self.items.where(selected: true).map(&:price).sum
	end
end
