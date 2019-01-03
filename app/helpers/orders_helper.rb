module OrdersHelper
	def orders_filtered_by_status
		[:pending, :paid, :sent, :cancelled, :refunded]
	end
end