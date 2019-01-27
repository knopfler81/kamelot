class Dashboard

#comptage général

#compter le nombre de visites et le nombre de "revenants"

	def clients_counts
		User.count
	end

	def products_counts
		Product.count
	end

	def orders_counts
		Order.count
	end

	def returned_order_counts
	end

#comptage par mois

	def clients_registration_by_month
	end

	def products_added_by_month
	end

	def orders_by_month
	end

	def returning_clients_by_month
	end

	def returned_order_by_month
	end

	#comptage par semaine 

	def clients_registration_by_week
	end

	def products_added_by_week
	end

	def orders_by_week
	end

	def returning_clients_by_week
	end

	def returned_order_by_week
	end

end
