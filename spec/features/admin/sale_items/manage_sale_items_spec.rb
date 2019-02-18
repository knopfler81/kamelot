require 'rails_helper'

RSpec.describe SaleItem do


	before(:each) do 
		nelly = create(:user, admin: true)
		login_as(nelly)
		@product = create(:product, title: "Chemise manches courtes", brand: "Side Park", title: "Chemise cool", price: 50, sizes_attributes: [size_name: "S", quantity: "5"])
	end

	scenario "The admin can add items to the basket" do

		visit admin_product_path(@product)
		select "S", from: "size_id"
		click_on "Ajouter Au Panier"
		
		expect(page).to have_content("Correctement ajouté au panier")

		click_on "Continuer"
		page.first(".card_link").click
		select "S", from: "size_id"
		click_on "Ajouter Au Panier"
		
		expect(page).to have_content("Correctement ajouté au panier")
		expect(page).to have_content("50")
		
		click_on "Encaisser"

		expect(page).to have_content("VALIDATION DE LA VENTE")
	end

	scenario "The admin can updated item quantity in the basket", :js do

		visit admin_product_path(@product)
		select "S", from: "size_id"
		click_on "Ajouter Au Panier"

		expect(page).to have_content("Chemise cool")

		select "3", from: "quantity"

		expect(page).to have_content("150")
	end

	scenario "The admin can remove items from the basket" do

		visit admin_product_path(@product)
		select "S", from: "size_id"
		click_on "Ajouter Au Panier"

		expect(page).to have_content("Chemise cool")

		page.first(:css, ".delete_btn").click

		expect(page).to have_no_content("Chemise cool")
	end
end