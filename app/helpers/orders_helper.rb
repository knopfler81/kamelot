module OrdersHelper
	def orders_filtered_by_status
		[ :all_orders, :missing_item, :cancelled_by_admin, :cancelled_by_client, :finished, :confirmed , :paid,  :partially_refunded, :totally_refunded,  ]
	end
end