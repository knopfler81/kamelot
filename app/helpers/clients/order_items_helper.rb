module Clients::OrderItemsHelper

	def not_available
		true if @items.map { |s| s.quantity == 0 }
	end
end