module OrdersHelper
	def orders_filtered_by_status
		[ :all_orders, :pending, :confirmed, :paid, :partly_shipped, :full_shipped, :cancelled_by_admin, :cancelled_by_client ]
	end
end