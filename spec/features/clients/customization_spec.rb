require 'rails_helper'

RSpec.describe Customization do

	context "Non admin user is not allowed" do 

		it "returns a routing error" do 
			login_as create(:user, admin: false)

			visit clients_customization_path

			expect(page).to raise_error(ActionController::RoutingError)
	  end 
	end
end