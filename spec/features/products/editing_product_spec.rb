require 'rails_helper'


RSpec.describe "Editing Product", :skip do 

	fixtures :users, :categories, :products

	context "As an admin I can" do 

		before(:each) do 
			nelly = users(:nelly)
			login_as(nelly)
		end

		scenario "Edit a product", :js do 

			product = products(:red_shirt)
			visit edit_product_path(product)

			fill_in "product[title]", with: "Pull en laine"
			fill_in "product[price]", with: 50
			fill_in "product[color]", with: "Noir"
			fill_in "product[description]", with: "Une nouvelle description "
			select 'Chemise', from: "product[category_id]"

			attach_file "product[attachments][]", Rails.root.join("spec/fixtures/products/pull_noir_2.jpg")

			first(".delete_size").click

			click_on "Ajouter une taille"
			find('.nested-fields:nth-child(1)').fill_in "Taille", with: "M"
			find('.nested-fields:nth-child(1)').fill_in "Quantité dans cette taille", with: 9

			click_on "Valider"
			expect(page).to have_content("Modifié avec succès")
		end
	end
end