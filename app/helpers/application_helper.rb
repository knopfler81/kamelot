module ApplicationHelper
	def delivery_date_1
	  order_date = Date.today 
	  delivery_date_1 = order_date + 3

	  if delivery_date_1.wday == 0
	    delivery_date_1 += 1
	  end
	  delivery_date_1
	end

	def delivery_date_2
	  order_date = Date.today
	  delivery_date_2 = order_date + 6
	  if delivery_date_2.wday == 0
	    delivery_date_2 += 1
	  end
	  delivery_date_2
	end
end
