require 'rails_helper'

RSpec.describe Order do 

	context "A not logged-in user" do 
		scenario "is asked to login before checking out" do
			@product = create(:product, brand: "Stil Park", title: "Chemise cool", price: 50)
			@variant = create(:variant, product_id: @product.id, size: "S")
			@stock   = create(:stock, variant_id: @variant.id, quantity: 3, price: @product.price)

			visit clients_product_path(@product)
			select "S", from: "variant_id"

			click_on "Ajouter Au Panier"

			visit clients_cart_path

			click_on "Commander"
		
			expect(page).to have_content("S'identifier")
		end
	end

	context "A logged-in user with out any address" do 

		scenario "is asked to fill in shipping address" do
			mark 	= create(:user)
			login_as(mark)
			@product = create(:product, brand: "Stil Park", title: "Chemise cool", price: 50)
			@variant = create(:variant, product_id: @product.id, size: "L")
			@stock   = create(:stock, variant_id: @variant.id, quantity: 3, price: @product.price)

			visit clients_product_path(@product)
			select "L", from: "variant_id"

			click_on "Ajouter Au Panier"
			expect(page).to have_content("Correctement ajouté au panier")

			click_on "Commander"

			click_on "Valider la commande"

			expect(page).to have_content("REMPLISSEZ VOTRE ADRESSE DE LIVRAISON")
		end
	end

	context "A logged-in user with shipping address" do 
		 scenario "can check out" do 
		 mark 	= create(:user)
		 login_as(mark)
		 @product = create(:product, brand: "Stil Park", title: "Chemise cool", price: 50)
		 @variant = create(:variant, product_id: @product.id, size: "L")
		 @stock   = create(:stock, variant_id: @variant.id, quantity: 3, price: @product.price)
		 create(:shipping_address, user_id: mark.id)

		 	visit clients_product_path(@product)
		 	select "L", from: "variant_id"

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
			mark 	= create(:user)
			login_as(mark)
			@product = create(:product, brand: "Stil Park", title: "Chemise cool", price: 50)
			@variant = create(:variant, product_id: @product.id, size: "L")
			@stock   = create(:stock, variant_id: @variant.id, quantity: 3, price: @product.price)
			create(:shipping_address, user_id: mark.id)

			visit clients_product_path(@product)
			select "L", from: "variant_id"

			click_on "Ajouter Au Panier"
			expect(page).to have_content("Correctement ajouté au panier")

			click_on "Commander"
			click_on "Valider la commande"

			expect(page).to have_content("Vous devez accepter les conditions générales de vente pour continuer")
		end
	end

	context "the order with a paid status" do 
		scenario "the user can cancel his order" do 
			mark 	= create(:user)
			login_as(mark)
			@product = create(:product, brand: "Stil Park", title: "Chemise cool", price: 50)
			@variant = create(:variant, product_id: @product.id, size: "L")
			@stock   = create(:stock, variant_id: @variant.id, quantity: 3, price: @product.price)
			create(:shipping_address, user_id: mark.id)
			order = create(:order, status: "pending", user_id: mark.id)

			visit clients_order_path(order)
			
			click_on "Annuler ma commande"
			
			expect(page).to have_content("Vous avez annulé votre commande")
		end
	end

	context "the order with a confirmed status" do 
		scenario "the user can't cancel his order" do 
			mark 	= create(:user)
			login_as(mark)
			@product = create(:product, brand: "Stil Park", title: "Chemise cool", price: 50)
			@variant = create(:variant, product_id: @product.id, size: "L")
			@stock   = create(:stock, variant_id: @variant.id, quantity: 3, price: @product.price)
			create(:shipping_address, user_id: mark.id)
			order = create(:order, status: "confirmed", user_id: mark.id)

			visit clients_order_path(order)
			
			expect(page).to have_content("Votre commande a été prise en charge")
		end
	end

	context "the order with a shipped status" do 
		scenario "the user can't cancel if his order is fully shipped" do 
			mark 	= create(:user)
			login_as(mark)
			@product = create(:product, brand: "Stil Park", title: "Chemise cool", price: 50)
			@variant = create(:variant, product_id: @product.id, size: "L")
			@stock   = create(:stock, variant_id: @variant.id, quantity: 3, price: @product.price)
			create(:shipping_address, user_id: mark.id)
			order = create(:order, status: "full_shipped", user_id: mark.id)

			visit clients_order_path(order)
			
			expect(page).not_to have_content("Annuler ma commande")
		end

		scenario "the user can't cancel if his order is partly shipped" do 
			mark 	= create(:user)
			login_as(mark)
			@product = create(:product, brand: "Stil Park", title: "Chemise cool", price: 50)
			@variant = create(:variant, product_id: @product.id, size: "L")
			@stock   = create(:stock, variant_id: @variant.id, quantity: 3, price: @product.price)
			create(:shipping_address, user_id: mark.id)
			order = create(:order, status: "partly_shipped", user_id: mark.id)

			visit clients_order_path(order)
			
			expect(page).not_to have_content("Annuler ma commande")
		end
	end

	context 'the order contains a product with a discount' do 
		scenario "The discount is applyed" do 
			@product = create(:product, brand: "Stil Park", title: "Chemise cool", price: 50, discount_percentage: 30)
			@variant = create(:variant, product_id: @product.id, size: "L")
			@stock   = create(:stock, variant_id: @variant.id, quantity: 3, price: @product.price)

			visit clients_product_path(@product)
			expect(page).to have_content("Promo")


			select "L", from: "variant_id"

			click_on "Ajouter Au Panier"
			expect(page).to have_content("Correctement ajouté au panier")
		end
	end
end