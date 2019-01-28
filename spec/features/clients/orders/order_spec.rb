require 'rails_helper'

RSpec.describe Order do 

	fixtures :users, :categories, :products, :sizes, :billing_addresses

	context "A user with a completed profile" do 
		scenario "can checkout" do
			john 	= users(:nelly)
			address = billing_addresses(:home)
			product = products(:red_shirt)

			login_as(john)

			visit clients_product_path(product)
			select "S", from: "size_id"

			click_on "Ajouter Au Panier"
			expect(page).to have_content("Correctement ajouté au panier")

			click_on "Commander"

			expect(page).to have_content("VÉRIFIEZ VOTRE COMMANDE")
		end
	end

	context "A user with out an account" do 
		scenario "is asked to create an before checking out" do
			product = products(:red_shirt)

			visit clients_product_path(product)
			
			select "S", from: "size_id"

			click_on "Ajouter Au Panier"
			expect(page).to have_content("Correctement ajouté au panier")
			click_on "Commander"
	
			expect(page).to have_content("S'identifier")
		end
	end
end