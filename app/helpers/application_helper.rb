module ApplicationHelper
	

	
	require 'rqrcode'

  def render_qr_code text, size = 5
    return if text.to_s.empty?
    qr = RQRCode::QRCode.new(text)
    sizeStyle = "width: #{size}px; height: #{size}px;"

    content_tag :table, class: "qrcode pull-right" do
      qr.modules.each_index do |x|
        concat(content_tag(:tr) do
          qr.modules.each_index do |y|
            color = qr.dark?(x, y) ? 'black' : 'white'
            concat content_tag(:td, nil, class: color, style: sizeStyle)
          end
        end)
      end
    end
  end

  def render_qr_code_small text, size = 3
    return if text.to_s.empty?
    qr = RQRCode::QRCode.new(text)
    sizeStyle = "width: #{size}px; height: #{size}px;"
    content_tag :table, class: "qrcode pull-right" do
      qr.modules.each_index do |x|
        concat(content_tag(:tr) do
          qr.modules.each_index do |y|
            color = qr.dark?(x, y) ? 'black' : 'white'
            concat content_tag(:td, nil, class: color, style: sizeStyle)
          end
        end)
      end
    end
  end
	
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

	def number_to_currency_euro(number)
	  number_to_currency(number, :unit => "€", percision: 2 , :delimiter => ".", format: "%n %u")
	end

##########CUSTOMIZATON####### 

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
