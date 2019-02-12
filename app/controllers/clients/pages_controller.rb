class Clients::PagesController < Clients::ApplicationController

	before_action :find_customization
	
	def landing
	end

	def secure_payment
	end

	def delivery
	end

	def general_condition_of_sales

	end

	def legal_notice
	end

	def confidentiality_policy
	end

	def cookies_policy
	end

	def sizes_guide
		#Pas encore ajouté dans la migration... ptho ? tableau texte? 
	end

	def site_map
		#pas de custom non plus a faire à la main
	end

	private

	def find_customization
		@customization = Customization.instance
	end
end
