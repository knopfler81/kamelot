require 'rails_helper'

RSpec.describe "Editing Product" do 

	fixtures :users, :categories, :products

	context "As an admin I can" do 

		before(:each) do 
			nelly = users(:nelly)
			login_as(nelly)
		end

		scenario "Edit a product" do 
			product = products(:black_k_l)

			visit admin_product_path(product)

			find(".edit_product").click

			fill_in "product[title]", with: "Pull en laine"

			click_on "Valider"
			expect(page).to have_content("Modifié avec succès")
		end
	end
end