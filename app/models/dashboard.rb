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

	def sizes_counts
		sizes = Product.all.map do |pr|
			pr.sizes.map {|s| s.quantity }.sum
		end
		sizes.sum
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

	#### SALES #####@@
	def sales_counts
		Sale.count
	end
	
	def sales_by_week
		Sale.group_by_week(:created_at, range: (@date_from..@date_to),time_zone: "Paris", week_start: :mon).count
	end

	def sales_by_month
		Sale.group_by_month(:created_at, range: (@date_from..@date_to),time_zone: "Paris", week_start: :mon).count
	end

	def sales_turnover_per_month
 		my_hash = Sale.group_by_month(:created_at, range: (@date_from..@date_to),time_zone: "Paris", week_start: :mon).sum(:total_cents)
 		my_hash.each { |k, v| my_hash[k] = v.to_i / 100 } 
	end

	def number_of_sales(size)
		@item = SaleItem.joins(:sale).where(size_id: size.id)
		unless @item.nil?
			@item.map {|s| s.quantity}.sum
		else
			0
		end
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

	def orders_turnover_per_month
 		Order.group_by_month(:created_at, range: (@date_from..@date_to),time_zone: "Paris", week_start: :mon).sum(:sub_total)
	end

	def number_of_orders(size)
		@item = OrderItem.joins(:order).where(size_id: size.id)
		unless @item.nil?
			@item.map {|s| s.quantity}.sum
		else
			0
		end
	end

	#Calculs journal

	def total_margin_value(size)
		size.quantity_stock * size.product.buying_price 
	end


	def margin_sales_line(size)
		margin_per_article(size) *  number_of_sales(size)
	end

	def margin_orders_line(size)
		margin_per_article(size) *  number_of_orders(size)
	end

	def margin_per_article(size)
		size.product.price - size.product.buying_price 
	end

	def starting_stock(size)
		size.quantity + number_of_orders(size) + number_of_sales(size)
	end

	def remaining_stock(size)
		size.quantity_stock - (number_of_orders(size) + number_of_sales(size))
	end

	def remaining_stock_value(size)
		remaining_stock(size) * size.product.buying_price
	end

	def total_buying_price
		size_date_range.map {|size| size.product.buying_price }.sum
	end

	def total_selling_price
		size_date_range.map {|size| size.product.price }.sum
	end


	def total_number_of_orders
		products = size_date_range.map do |size|
			OrderItem.joins(:order).where(size_id: size.id).count
		end
		products.sum
	end

	def total_number_of_sales
		products = size_date_range.map do |size|
			SaleItem.joins(:sale).where(size_id: size.id).count
		end
		products.sum
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

	def turnover_orders(size)
		size.product.price *  number_of_orders(size)
	end

	def turnover_sales(size)
		size.product.price *  number_of_sales(size)
	end

	private 

	def parsed_date(date_string, default)
		Date.parse(date_string)
		rescue ArgumentError, TypeError
		default
	end
end
