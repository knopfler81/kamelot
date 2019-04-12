class Returning < ApplicationRecord
	belongs_to :order
	belongs_to :user
	has_many   :items, class_name: "ReturningItem", dependent: :destroy

	after_create :set_returning_items

	after_save :change_status
	after_save :re_add_to_stock

	enum status: { creating: 0, pending: 1, confirmed: 2, refunded: 3 }

	def re_add_to_stock 
		if self.status == "refunded"
			self.items.where(selected: true).each do |item|
				stock = Stock.where(variant_id: item.variant_id).last
				stock.quantity += 1
				stock.save
			end
		end
	end

	def change_status
		if !self.reason.nil? && self.status == "creating"
			self.status == "pending"
		end
	end

	def set_returning_items
		order = self.order
		order.items.each do |item|
			ReturningItem.create!(
				returning_id: self.id,
				order_item_id: item.id,
				variant_id: item.variant.id,
				price: item.price,
				quantity: 1
			)
		end
	end

	def set_order_status 
	 	self.order.refunded! if self.refunded?
	end	
	
	def total_refund
		self.items.where(selected: true).map do |item|
			item.quantity * item.price
		end.sum
	end

	def total_items_count
		self.items.where(selected: true).map(&:quantity).sum
	end
end