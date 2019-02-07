require 'rails_helper'

RSpec.describe "Editing Product" do 

	fixtures :users, :categories, :products, :sizes

	context "As an admin I can" do 

		before(:each) do 
			nelly = users(:nelly)
			login_as(nelly)
		end

		scenario "Edit a product",:js do 
			product = products(:red_shirt)
			
			visit admin_product_path(product)

			find(".edit_product").click

			fill_in "product[title]", with: "Pull en laine"
			fill_in "product[description]", with: "Une autre description"

			click_on "Mettre à jour l'article"

			expect(page).to have_content("L'article a bien été modifié")
		end
	end
end