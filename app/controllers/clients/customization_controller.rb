class Clients::CustomizationController < Clients::ApplicationController
	before_action :find_customization

	def show
	end

	def update
	 	if @customization.update_attributes(customization_params)
	 		redirect_to clients_customization_path, notice: "La customization a bien été mise à jour"
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
							)
	end
	
end