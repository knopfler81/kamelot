require 'rails_helper'

RSpec.describe "Creating Product" , :js do 

	context "As an admin I can" do 

		before(:each) do 
			nelly = create(:user, admin: true)
			gillet = create(:category, title: "Gillet")
			login_as(nelly)
		end

		scenario "Create a product"  do 
			visit 'admin/products/new'
			fill_in "product[brand]", with: "Side Park"
			fill_in "product[title]", with: "Gillet en laine"
			fill_in "product[price]", with: 50
			fill_in "product[buying_price]", with: 10
			fill_in "product[description]", with: "Une description pour ce gillet"
			fill_in "product[color]", with: "Noir"
			fill_in "product[ref]", with: "FF00"
			select "Gillet", from: "product[category_id]"

			attach_file "product[attachments][]", Rails.root.join("spec/fixtures/product/attachments/pull_noir_1.jpg")

			click_on "Ajouter une variante"
			find('.nested-fields:nth-child(1)').fill_in "Taille", with: "M"
			find('.nested-fields:nth-child(1)').fill_in "Couleur, si autres couleurs disponibles", with: 9

			click_on "Valider le produit"

			expect(page).to have_content("L'article a bien été créé")
		end
	end
end