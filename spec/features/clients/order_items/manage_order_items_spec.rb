require 'rails_helper'

RSpec.describe OrderItem do


	before(:each) do 
		john = create(:user)
		login_as(john)
		@product = create(:product, title: "Chemise", brand: "Side Park", title: "Chemise cool", price: 50, sizes_attributes: [size_name: "S", quantity: "5"])
	end

	scenario "A user can add items to his cart" do

		visit clients_product_path(@product)
		select "S", from: "size_id"
		click_on "Ajouter Au Panier"
		
		expect(page).to have_content("Correctement ajouté au panier")

		click_on "Continuer les achats"
		page.first(".box_link").click
		select "S", from: "size_id"
		click_on "Ajouter Au Panier"
		
		expect(page).to have_content("Correctement ajouté au panier")
		expect(page).to have_content("50.00 €")
		
		click_on "Commander"

		expect(page).to have_content("VALIDATION DE VOTRE COMMANDE")
	end

	scenario "A user can updated item quantity in his cart", :js do

		visit clients_product_path(@product)
		select "S", from: "size_id"
		click_on "Ajouter Au Panier"

		expect(page).to have_content("Chemise cool")

		select "3", from: "quantity"

		expect(page).to have_content("150.00 €")
	end

	scenario "A user can remove items from his cart" do

		visit clients_product_path(@product)
		select "S", from: "size_id"
		click_on "Ajouter Au Panier"

		expect(page).to have_content("Chemise cool")

		page.first(:css, ".delete_btn").click

		expect(page).to have_no_content("Chemise cool")
	end
end