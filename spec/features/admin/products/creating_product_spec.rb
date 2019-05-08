require 'rails_helper'

RSpec.describe "Creating Product" do 

	context "As an admin I can" do 

		before(:each) do 
			nelly = create(:user, admin: true)
			company = create(:supplier, company: "Morrin")
			main   = create(:main_category)
			gillet = create(:category, title: "Gillet", main_category_id: main.id)
			login_as(nelly)
		end

		scenario "Create a product" do 
			visit new_admin_product_path
			fill_in "product[brand]", with: "Side Park"
			fill_in "product[title]", with: "Gillet en laine"
			fill_in "product[price]", with: 50
			fill_in "product[buying_price]", with: 10
			fill_in "product[description]", with: "Une description pour ce gillet"
			fill_in "product[color]", with: "Noir"
			fill_in "product[ref]", with: "FF00"
			fill_in "product[weight]", with: 0.300
			select "Gillet",  from: "product[category_id]"
			select "Morrin", from: "product[supplier_id]"

			attach_file "product[attachments][]", Rails.root.join("spec/fixtures/product/attachments/pull_noir_1.jpg")

			click_on "Valider le produit"

			expect(page).to have_content("L'article a bien été créé")
		end
	end
end