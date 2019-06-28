class SaleItem < ApplicationRecord
	belongs_to :sale
	belongs_to :variant


	def remove_from_stock

			Stock.where(variant_id: item.variant_id).where('quantity > 0').order(:created_at).reduce(self.quantity.to_i) do |quantity, stock|
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
