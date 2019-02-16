require 'rails_helper'

RSpec.describe "Deleting Product" do 

	#fixtures :users, :categories, :products

	context "As an admin I can" do 
		scenario "Destroy a product" do 
			nelly = create(:user, admin: true)
			login_as(nelly)
			ken = create(:product, brand: "Side Park", sizes_attributes: [size_name: "L", quantity: "3"])

			visit admin_product_path(ken)
			
			find(".delete_product").click

			expect(page).to have_content("L'article a bien été supprimé")		
		end
	end	
end