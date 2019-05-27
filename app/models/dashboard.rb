class Dashboard

	attr_reader :date_from, :date_to

	def initialize(params)
		params ||= {}
		@date_from = parsed_date(params[:date_from],Time.now.beginning_of_month.to_date.to_s)
		@date_to   = parsed_date(params[:date_to], (Date.today + 1).to_s)
	end


	def variant_date_range
		Variant.where('created_at BETWEEN ? AND ?', @date_from, @date_to)
	end

	def product_date_range
		Product.where('created_at BETWEEN ? AND ?', @date_from, @date_to)
	end

	##### PRODUCT #####
	def products_counts
		Product.count
	end

	def stock_counts
		stocks = Variant.all.map do |var|
			var.stocks.map(&:quantity)
		end
		stocks.flatten.sum
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

	def variants_per_products
		@variants = Product.joins(:variants).group(:size).count
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


	def sale_item_category
		SaleItem.joins(variant: [product: :category]).group('categories.title').sum('quantity')
	end

	def number_of_sales(variant)
		@item = SaleItem.joins(:sale).where(variant_id: variant.id)
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

	def order_item_category
		OrderItem.joins(variant: [product: :category]).group('categories.title').sum('quantity')
	end


	def number_of_orders(variant)
		@item = OrderItem.joins(:order).where(variant_id: variant.id)
		unless @item.nil?
			@item.map {|s| s.quantity}.sum
		else
			0
		end
	end


	#### RETURNINGS ##### 
		def returnings_counts
			Returning.count
		end

		def returnings_status
			Returning.where.not(status: 0).group(:status).count
		end
		
		def returnings_by_week
			Returning.group_by_week(:created_at, range: (@date_from..@date_to),time_zone: "Paris", week_start: :mon).count
		end

		def returnings_by_month
			Returning.group_by_month(:created_at, range: (@date_from..@date_to),time_zone: "Paris", week_start: :mon).count
		end

		def refunded_returnings_count
			Returning.where(status: 4).count
		end

		def returning_item_category
			ReturningItem.joins(variant: [product: :category]).group('categories.title').sum('quantity')
		end


		def number_of_returnings(variant)
			@item = ReturningItem.joins(:returning).where(variant_id: variant.id)
			unless @item.nil?
				@item.map {|s| s.quantity}.sum
			else
				0
			end
		end

	#Calculs journal

	def total_margin_value(variant)
		variant.stocks.map(&:quantity).sum * variant.product.buying_price 
	end


	def margin_sales_line(variant)
		margin_per_article(variant) *  number_of_sales(variant)
	end

	def margin_orders_line(variant)
		margin_per_article(variant) *  number_of_orders(variant)
	end

	def margin_per_article(variant)
		variant.product.price - variant.product.buying_price 
	end

	def starting_stock(variant)
		variant.quantity + number_of_orders(variant) + number_of_sales(variant)
	end

	def remaining_stock(variant)
		variant.stocks.sum(:quantity)
	end

	def remaining_stock_value(variant)
		remaining_stock(variant) * variant.product.buying_price
	end

	def total_buying_price
		variant_date_range.map {|variant| variant.product.buying_price }.sum
	end

	def total_selling_price
		variant_date_range.map {|variant| variant.product.price }.sum
	end


	def total_number_of_orders
		products = variant_date_range.map do |variant|
			OrderItem.joins(:order).where(variant_id: variant.id).count
		end
		products.sum
	end

	def total_number_of_sales
		products = variant_date_range.map do |variant|
			SaleItem.joins(:sale).where(variant_id: variant.id).count
		end
		products.sum
	end

	def variants_and_quantity(product)
		variant_name = product.variants.map do |s|
		 s.variant_name
		end
		quantity = product.variants.map do |s|
		 s.quantity
		end
		variants =  variant_name.zip(quantity)
	end

	def turnover_orders(variant)
		variant.product.price *  number_of_orders(variant)
	end

	def turnover_sales(variant)
		variant.product.price *  number_of_sales(variant)
	end

	private 

	def parsed_date(date_string, default)
		Date.parse(date_string)
		rescue ArgumentError, TypeError
		default
	end
end
