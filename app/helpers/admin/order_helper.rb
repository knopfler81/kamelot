module Admin::OrderHelper

	def all_items_are_available?
		@order.pending? || @order.confirmed? || @order.paid? ||  @order.full_shipped?
	end


	def some_items_are_missing?
		@order.paid? || @order.full_shipped? 
	end
end