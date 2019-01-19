require 'rails_helper'

RSpec.describe "Creating Product" , :js do 

	fixtures :users, :categories

	context "As an admin I can" do 

		before(:each) do 
			nelly = users(:nelly)
			login_as(nelly)
		end

		scenario "Create a product"  do 
			visit 'admin/products/new'
			fill_in "product[brand]", with: "Side Park"
			fill_in "product[title]", with: "Pull en laine"
			fill_in "product[price_cents]", with: 50
			fill_in "product[description]", with: "Une description pour ce pull"
			fill_in "product[color]", with: "Noir"
			select "Pull", from: "product[category_id]"

			attach_file "product[attachments][]", Rails.root.join("spec/fixtures/product/attachments/pull_noir_1.jpg")

			click_on "Ajouter une taille"
			find('.nested-fields:nth-child(1)').fill_in "Taille", with: "M"
			find('.nested-fields:nth-child(1)').fill_in "Quantité dans cette taille", with: 9
			click_on "Valider le produit"

			expect(page).to have_content("Créé avec succès")
		end
	end
end