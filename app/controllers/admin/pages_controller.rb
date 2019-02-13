class Admin::PagesController < Admin::ApplicationController
	
	def landing
		@customization = Customization.instance
	end
end
