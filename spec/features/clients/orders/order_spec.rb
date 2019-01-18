require 'rails_helper'

RSpec.describe Order do 

	fixtures :users, :categories, :products, :sizes, :billing_addresses

	context "A not logged in user" do 
		scenario "is redirect to the sign up form before adding article in his basket" do
			nelly 	= users(:nelly)
			product = products(:red_shirt)

			visit clients_product_path(product)
			click_on "Ajouter"
			expect(page).to have_content("Connexion")
		end
	end

	context "A user with a completed profile" do 
		scenario "can checkout" do
			john 	= users(:nelly)
			address = billing_addresses(:home)
			product = products(:red_shirt)

			login_as(john)

			visit clients_product_path(product)
			select "S", from: "size_id"
			find("#quantity").set 2

			click_on "Ajouter Au Panier"
			expect(page).to have_content("Correctement ajouté au panier")
			click_on "Checkout"

			expect(page).to have_content("Vérifier votre commande")
		end
	end

	context "A user without a completed profile" do 
		scenario "is asked to compelte his profile before checking out" do
			mark 	= users(:mark)
			product = products(:red_shirt)

			login_as(mark)

			visit clients_product_path(product)
			
			find("#quantity").set 2
			select "S", from: "size_id"

			click_on "Ajouter Au Panier"
			expect(page).to have_content("Correctement ajouté au panier")
			click_on "Checkout"
	
			expect(page).to have_content("Ajouter une adresse pour continuer")
		end
	end
end