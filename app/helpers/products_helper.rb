module ProductsHelper
	def number_to_currency_euro(number)
	  number_to_currency(number, :unit => "€", percision: 2 , :delimiter => ".", format: "%n %u")
	end

	def available_sizes(product)
		sizes = product.variants.joins(:stocks).where('stocks.quantity >?', 0).map do |var|
			var.size
		end
	end
end