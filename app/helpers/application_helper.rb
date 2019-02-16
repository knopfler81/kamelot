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


	def prefered_body_color
		return Customization.instance.body_color if Customization.instance.body_color.present?
		'#fff'
	end

	def prefered_navbar_color
		return Customization.instance.navbar_color if Customization.instance.navbar_color.present?
		'#fff'
	end

	def prefered_navbar_links_color
		return Customization.instance.nav_links_color if Customization.instance.nav_links_color.present?
		'#aaa'
	end

	def prefered_btn_main_color
		return Customization.instance.btn_main_color if Customization.instance.btn_main_color.present?
		"#111"
	end

	def prefered_btn_main_text_color
		return Customization.instance.main_btn_text_color if Customization.instance.main_btn_text_color.present?
		"#fff"
	end

	def prefered_btn_secondary_color
		return Customization.instance.btn_secondary_color if Customization.instance.btn_secondary_color.present?
		"#fff"
	end

	def prefered_btn_secondary_text_color
		return Customization.instance.secondary_btn_text_color if Customization.instance.secondary_btn_text_color.present?
		"#fff"
	end


	def prefered_text_color
		return Customization.instance.text_color if Customization.instance.text_color.present?
		"#111"
	end
end
