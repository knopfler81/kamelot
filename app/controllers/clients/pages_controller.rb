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

	def sitemap
		redirect_to 'https://shopsuper.s3.eu-west-3.amazonaws.com/sitemap/sitemap.xml.gz'
	end

	private

	def find_customization
		@customization = Customization.instance
	end
end
