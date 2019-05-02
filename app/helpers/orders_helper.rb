module OrdersHelper
	def orders_filtered_by_status
		[ :all_orders, :pending, :shipped, :cancelled_by_admin, :cancelled_by_client, :confirmed ]
	end
end