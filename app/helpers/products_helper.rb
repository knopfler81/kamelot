module ProductsHelper

	def number_to_currency_euro(number)
	  number_to_currency(number, :unit => "€", percision: 2 , :delimiter => ".", format: "%n %u")
	end

end