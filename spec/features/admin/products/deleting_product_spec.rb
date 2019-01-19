require 'rails_helper'

RSpec.describe "Deleting Product" do 

	fixtures :users, :categories, :products

	context "As an admin I can" do 

		before(:each) do 
			nelly = users(:nelly)
			login_as(nelly)
		end

		scenario "Destroy a product" do 
			ken = products(:warm_sweat)

			visit admin_product_path(ken)
			
			find(".delete_product").click

			expect(page).to have_content("Supprimé avec succès")		
		end
	end	
end