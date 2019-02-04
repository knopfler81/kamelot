class Dashboard


	##### PRODUCT #####

	def products_counts
		Product.count
	end

	def products_added_by_month
		Product.group_by_month(:created_at, range: (6.months.ago..Time.now),time_zone: "Paris", week_start: :mon).count
	end

	def products_added_by_week
		Product.group_by_week(:created_at, range: (6.months.ago..Time.now),time_zone: "Paris", week_start: :mon).count
	end


	def products_per_category
		@categories = Category.joins(:products).group(:title).count
	end

	def sizes_per_products
		@sizes = Product.joins(:sizes).group(:size_name).count
	end

	##### CLIENTS #####

	def clients_counts
		User.count
	end

	def clients_registration_by_month
		User.group_by_month(:created_at, range: (6.months.ago..Time.now),time_zone: "Paris", week_start: :mon).count
	end

	def clients_registration_by_week
		User.group_by_week(:created_at, range: (6.months.ago..Time.now),time_zone: "Paris", week_start: :mon).count
	end

	def clients_gender
		[["Homme", User.where(gender: false).count],[ "Femme", User.where(gender: true).count]]
	end

	##### ORDERS #####

	def orders_counts
		Order.count
	end
	
	def orders_by_week
		Order.group_by_week(:created_at, range: (6.months.ago..Time.now),time_zone: "Paris", week_start: :mon).count
	end

	def orders_by_month
		Order.group_by_month(:created_at, range: (6.months.ago..Time.now),time_zone: "Paris", week_start: :mon).count
	end

	def refunded_orders_count
		Order.where(status: 4).count
	end

	def orders_status
		Order.where.not(status: 0).group(:status).count
	end

	def turnover_per_month
 		Order.group_by_month(:created_at, range: (6.months.ago..Time.now),time_zone: "Paris", week_start: :mon).sum(:total_cents)
	end

	

end
