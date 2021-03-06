module ResetCustomization
	def reset
		@customization.navbar_color             = Customization.instance.class.columns_hash['navbar_color'].default
		@customization.body_color               = Customization.instance.class.columns_hash['body_color'].default
		@customization.nav_links_color          = Customization.instance.class.columns_hash['nav_links_color'].default
		@customization.btn_main_color           = Customization.instance.class.columns_hash['btn_main_color'].default
		@customization.btn_secondary_color      = Customization.instance.class.columns_hash['btn_secondary_color'].default
		@customization.text_color               = Customization.instance.class.columns_hash['text_color'].default
		@customization.main_btn_text_color      = Customization.instance.class.columns_hash['main_btn_text_color'].default
		@customization.secondary_btn_text_color = Customization.instance.class.columns_hash['secondary_btn_text_color'].default
		@customization.main_image               = open('https://s3-eu-west-1.amazonaws.com/mygasoline/landing.jpg')
		@customization.text_main_image          = Customization.instance.class.columns_hash['text_main_image'] = "Customisez moi"
		@customization.text_btn_main_image      = Customization.instance.class.columns_hash['text_btn_main_image'] = "Customisez moi"
		@customization.text_second_image        = Customization.instance.class.columns_hash['text_main_image'] = "Customisez moi"
		@customization.text_btn_second_image    = Customization.instance.class.columns_hash['text_btn_main_image'] = "Customisez moi"
		@customization.text_third_image         = Customization.instance.class.columns_hash['text_main_image'] = "Customisez moi"
		@customization.text_btn_third_image     = Customization.instance.class.columns_hash['text_btn_main_image'] = "Customisez moi"
		@customization.save
		redirect_to admin_customization_path, notice: "La customisation a bien été réinitialisée"
	end
end