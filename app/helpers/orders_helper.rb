module OrdersHelper
	def orders_filtered_by_status
		[ :paid, :confirmed, :shipped, :cancelled, :refunded]
	end
end