class Dashboard

	attr_reader :date_from, :date_to

	def initialize(params)
		params ||= {}
		@date_from = parsed_date(params[:date_from],Time.now.beginning_of_month.to_date.to_s)
		@date_to   = parsed_date(params[:date_to], (Date.today + 1).to_s)
	end

	def size_date_range
		Size.where('created_at BETWEEN ? AND ?', @date_from, @date_to)
	end

	def product_date_range
		Product.where('created_at BETWEEN ? AND ?', @date_from, @date_to)
	end

	##### PRODUCT #####

	def products_counts
		Product.count
	end

	def products_added_by_month
		Product.group_by_month(:created_at, range: (@date_from..@date_to),time_zone: "Paris", week_start: :mon).count
	end

	def products_added_by_week
		Product.group_by_week(:created_at, range: (@date_from..@date_to),time_zone: "Paris", week_start: :mon).count
	end

	def products_per_category
		@categories = Category.joins(:products).group(:title).count
	end

	def sizes_per_products
		@sizes = Product.joins(:sizes).group(:size_name).sum(:quantity)
	end

	##### CLIENTS #####

	def clients_counts
		User.count
	end

	def clients_registration_by_month
		User.group_by_month(:created_at, range: (@date_from..@date_to),time_zone: "Paris", week_start: :mon).count
	end

	def clients_registration_by_week
		User.group_by_week(:created_at, range: (@date_from..@date_to),time_zone: "Paris", week_start: :mon).count
	end

	def clients_gender
		[["Homme", User.where(gender: false).count],[ "Femme", User.where(gender: true).count]]
	end

	##### ORDERS #####

	def orders_counts
		Order.count
	end
	
	def orders_by_week
		Order.group_by_week(:created_at, range: (@date_from..@date_to),time_zone: "Paris", week_start: :mon).count
	end

	def orders_by_month
		Order.group_by_month(:created_at, range: (@date_from..@date_to),time_zone: "Paris", week_start: :mon).count
	end

	def refunded_orders_count
		Order.where(status: 4).count
	end

	def orders_status
		Order.where.not(status: 0).group(:status).count
	end

	def turnover_per_month
 		Order.group_by_month(:created_at, range: (@date_from..@date_to),time_zone: "Paris", week_start: :mon).sum(:total_cents)
	end


	def number_of_sales(size)

		@item = OrderItem.joins(:order).where(size_id: size.id)
		unless @item.nil?
			@item.map {|s| s.quantity}.sum
		else
			0
		end
	end

	def cost_price(size)
		size.product.price - size.product.buying_price 
	end

	def starting_stock(size)
		size.quantity + number_of_sales(size)
	end

	def remaining_stock(size)
		size.quantity	
	end

	def remaining_stock_value(size)
		remaining_stock(size) * cost_price(size)
	end


	def total_starting_stock
		size_date_range.map {|size| size.quantity }.sum
	end

	def total_buying_price
		size_date_range.map {|size| size.product.buying_price }.sum
	end

	def total_selling_price
		size_date_range.map {|size| size.product.price }.sum
	end

	def total_cost_price
		products = size_date_range.map do |size|
			size.product.price - size.product.buying_price 
		end
		products.sum
	end

	def total_number_of_sales
		products = size_date_range.map do |size|
			OrderItem.joins(:order).where(size_id: size.id).count
		end
		products.sum
	end

	def total_remaining_stock
		total_starting_stock - total_number_of_sales
	end

	def total_remaining_stock_value
		size_date_range.map {|s| remaining_stock_value(s)}.sum
	end

	def sizes_and_quantity(product)
		size_name = product.sizes.map do |s|
		 s.size_name
		end
		quantity = product.sizes.map do |s|
		 s.quantity
		end
		sizes =  size_name.zip(quantity)
	end

	private 

	def parsed_date(date_string, default)
		Date.parse(date_string)
		rescue ArgumentError, TypeError
		default
	end
end
