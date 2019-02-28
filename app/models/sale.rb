class Sale < ApplicationRecord
	belongs_to :user,  optional: true
	has_many :items, class_name: "SaleItem", dependent: :destroy

	monetize :total_cents

	enum status: [:pending, :paid, :cancelled ]

	def remove_from_stock
	  self.items.each do |item|
	    @variant = Variant.where(id: item.variant_id).last
	    @variant.stocks.last.quantity -= item.quantity.to_i
	    @variant.save
	  end
	end

	def update_sub_total!
	  self.sub_total = self.items.sum('quantity * price')
	  self.save
	end

	def update_total!
	  self.total = self.items.sum('quantity * price')
	  self.save
	end

	def count_articles
		 self.items.map(&:quantity).sum
	end
end
