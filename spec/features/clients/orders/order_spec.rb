require 'rails_helper'

RSpec.describe Order do 

	context "A not logged-in user" do 
		scenario "is asked to login before checking out" do
			product = create(:product, brand: "Side Park", sizes_attributes: [size_name: "S", quantity: "3"])

			visit clients_product_path(product)
			select "S", from: "size_id"

			click_on "Ajouter Au Panier"

			visit clients_cart_path

			click_on "Commander"
		
			expect(page).to have_content("S'identifier")
		end
	end

	context "A logged-in user with out any address" do 

		before(:each) do
			mark 	= create(:user)
			login_as(mark)
			@product = create(:product, brand: "Side Park", sizes_attributes: [size_name: "L", quantity: "3"])
		end

		scenario "is asked to fill in shipping address" do

			visit clients_product_path(@product)
			select "L", from: "size_id"

			click_on "Ajouter Au Panier"
			expect(page).to have_content("Correctement ajouté au panier")

			click_on "Commander"

			click_on "Valider la commande"

			expect(page).to have_content("REMPLISSEZ VOTRE ADRESSE DE LIVRAISON")
		end
	end

	context "A logged-in user with shipping address" do 
		before(:each) do
			mark 	= create(:user)
			login_as(mark)
			create(:shipping_address, user_id: mark.id)
			@product = create(:product, brand: "Side Park", sizes_attributes: [size_name: "L", quantity: "3"])
		end
		 scenario "can check out" do 
		 
		 	visit clients_product_path(@product)
		 	select "L", from: "size_id"

		 	click_on "Ajouter Au Panier"
		 	expect(page).to have_content("Correctement ajouté au panier")

		 	click_on "Commander"
		 	
		  page.check("J'ai lu et accepte les CGV.")
		  #page.check("#order_gcos_accepted")
	 		#find(:xpath, "//*[@id='order_gcos_accepted']").click

		 	click_on "Valider la commande"

		 	expect(page).to have_content("PAIMENT PAR CARTE BANCAIRE")
		 end
	end

	context "general condition of sales must be checked to process payment" do 
		before(:each) do
			mark 	= create(:user)
			login_as(mark)
			create(:shipping_address, user_id: mark.id)
			@product = create(:product, brand: "Side Park", sizes_attributes: [size_name: "S", quantity: "3"])
		end
		scenario "the user hasn't check the box" do 
			
			visit clients_product_path(@product)
			select "S", from: "size_id"

			click_on "Ajouter Au Panier"
			expect(page).to have_content("Correctement ajouté au panier")

			click_on "Commander"
			click_on "Valider la commande"

			expect(page).to have_content("Vous devez accepter les conditions générales de vente pour continuer")
		end
	end
end