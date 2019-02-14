require 'rails_helper'

RSpec.describe "Editing Product" do 

	context "As an admin I can" do 
		scenario "Edit a product",:js do 
			nelly = create(:user, admin: true)
			login_as(nelly)
			product = create(:product, brand: "Side Park", sizes_attributes: [size_name: "L", quantity: "3"])
			
			visit admin_product_path(product)

			find(".edit_product").click

			fill_in "product[title]", with: "Pull en laine"
			fill_in "product[description]", with: "Une autre description"

			click_on "Mettre à jour l'article"

			expect(page).to have_content("L'article a bien été modifié")
		end
	end
end