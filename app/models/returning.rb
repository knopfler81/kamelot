class Returning < ApplicationRecord
	belongs_to :order
	has_many   :items, class_name: "ReturningItem", dependent: :destroy


	after_create :set_returning_items

	def set_returning_items

		order = self.order

		order.items.each do |item|
			ReturningItem.create!(
				returning_id: self.id,
				order_item_id: item.id,
				)
		end
	end
end
