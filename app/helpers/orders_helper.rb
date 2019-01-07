module OrdersHelper
	def orders_filtered_by_status
		[:pending, :paid, :confirmed, :shipped, :cancelled, :refunded]
	end
end