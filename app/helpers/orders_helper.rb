module OrdersHelper
	def orders_filtered_by_status
		[ :all_orders, :pending_orders, :confirmed_orders, :paid_orders, :partly_shipped_orders, :full_shipped_orders, :cancelled_by_admin_orders, :cancelled_by_client_orders, ]
	end
end