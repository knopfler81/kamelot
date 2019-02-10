require 'rails_helper'

RSpec.describe Order do 

	fixtures :users, :categories, :products, :sizes, :shipping_addresses, :orders


	context "A not logged-in user" do 
		scenario "is asked to login before checking out" do
			product = products(:red_shirt)
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
			mark 	= users(:mark)
			login_as(mark)
		end

		scenario "is asked to fill in shipping address" do
			product = products(:red_shirt)

			visit clients_product_path(product)
			select "S", from: "size_id"

			click_on "Ajouter Au Panier"
			expect(page).to have_content("Correctement ajouté au panier")

			click_on "Commander"

			click_on "Valider la commande"

			expect(page).to have_content("REMPLISSEZ VOTRE ADRESSE DE LIVRAISON")
		end
	end

	context "A logged-in user with shipping address" do 
		before(:each) do
			home  = shipping_addresses(:home)
			john 	= users(:john)
			login_as(john)
		end
		 scenario "can check out" do 
		 	product = products(:red_shirt)
		 	visit clients_product_path(product)
		 	select "S", from: "size_id"

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
		scenario "the user hasn't check the box" do 
			home  = shipping_addresses(:home)
			john 	= users(:john)
			login_as(john)
			product = products(:red_shirt)
			visit clients_product_path(product)
			select "S", from: "size_id"

			click_on "Ajouter Au Panier"
			expect(page).to have_content("Correctement ajouté au panier")

			click_on "Commander"
			click_on "Valider la commande"

			expect(page).to have_content("Vous devez accepter les conditions générales de vente pour continuer")
		end
	end

end