class Admin::CustomizationController < Clients::ApplicationController
	before_action :find_customization
	include ResetCustomization
	
	def show
	end

	def update
	 	if @customization.update_attributes(customization_params)
	 		redirect_to admin_customization_path, notice: "La customization a bien été mise à jour"
	 	else
	 		render :show, alert: "WOOOOOPS"
	 	end
	end

	private
	
	def find_customization
		@customization = Customization.instance
	end

	def customization_params
		params.require(:customization)
			.permit(  :main_image, 
								:text_main_image,       
								:text_btn_main_image,  
								:main_link, 
							  :second_image,  
							  :second_link,        
							  :third_image,  
							  :third_link,         
							  :text_second_image,     
								:text_btn_second_image, 
							  :text_third_image,      
								:text_btn_third_image,  
								:secure_payment, 
								:delivery, 
								:general_condition_of_sales, 
								:legal_notice, 
								:confidentiality_policy,
								:cookies_policy,
								:body_color,
								:navbar_color,
								:nav_links_color,
								:btn_main_color,
								:btn_secondary_color,
								:text_color,
								:main_btn_text_color,
								:secondary_btn_text_color,
								:logo,
								:logo_banner
							)
	end
	
end