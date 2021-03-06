require 'rails_helper'

RSpec.describe SaleItem do

	before(:each) do 
		nelly = create(:user, admin: true)
		login_as(nelly)
		@product = create(:product, brand: "Side Park", title: "Chemise cool", market_price: 50)
		@variant = create(:variant, product_id: @product.id, size: "S")
		@stock   = create(:stock, variant_id: @variant.id, quantity: 3, market_price: @product.market_price)
	end

	scenario "The admin can add items to the basket" do

		visit admin_product_path(@product)
		select "S", from: "variant_id"
		click_on "Ajouter Au Panier"
		
		expect(page).to have_content("Correctement ajouté au panier")

		expect(page).to have_content("50")
		
		click_on "Valider la vente"

		expect(page).to have_content("LES VENTES MARCHÉS")
	end

	scenario "The admin can updated item quantity in the basket", :js do

		visit admin_product_path(@product)
		select "S", from: "variant_id"
		click_on "Ajouter Au Panier"

		expect(page).to have_content("Chemise cool")

		select "3", from: "quantity"

		expect(page).to have_content("150")
	end

	scenario "The admin can remove items from the basket" do

		visit admin_product_path(@product)
		select "S", from: "variant_id"
		click_on "Ajouter Au Panier"

		expect(page).to have_content("Chemise cool")

		page.first(:css, ".delete_btn").click

		expect(page).to have_no_content("Chemise cool")
	end
end