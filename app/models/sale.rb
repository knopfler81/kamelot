class Sale < ApplicationRecord
	belongs_to :user,  optional: true
	has_many :items, class_name: "SaleItem", dependent: :destroy

	monetize :total_cents

	enum status: [:pending, :paid, :cancelled ]

	def remove_from_stock
		self.items.each do |item|
			Stock.where(variant_id: item.variant_id).where('quantity > 0').order(:created_at).reduce(item.quantity.to_i) do |quantity, stock|
			  if (leftover = quantity - stock.quantity) <= 0
			    stock.update_attributes! quantity: stock.quantity - quantity
			    break
			  else
			    stock.update_attributes! quantity: 0
			    leftover
			  end
			end
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



