require 'rails_helper'

RSpec.describe Order do 

	def set_users
		@user = create(:user)
		nelly = create(:user, admin: true)
		address = create(:shipping_address, user_id: @user.id)
		login_as nelly
	end

	context "Ordered items are in stock" do 
		scenario "Admin prepare the order" do
			set_users
			order = create(:order, user_id: @user.id, status: "paid")

			visit admin_order_path(order)

			click_on "Je prépare la commande"

			expect(page).to have_content("Status: En cours de préparation")
		end

		scenario "Admin send the order" do
			set_users
			order = create(:order, user_id: @user.id, status: "confirmed")

			visit admin_order_path(order)

			click_on "J'ai envoyé la commande"

			expect(page).to have_content("Status: Envoyée - Terminée")
		end
	end

	context "Some items are missing" do 
		scenario "Select the missing items", :js do 
			set_users 
			order = create(:order, user_id: @user.id, status: "paid")
			item_1 = create(:order_item, quantity: 3, order_id: order.id, missing_quantity: 0)


			visit admin_order_path(order)

			click_on "Un article manque"

			expect(page).to have_content("Séléctionnez les articles qui ne sont plus disponibles")
	
			select "2", from: "missing_quantity"
		
			click_on "Confirmer et prévenir le client"

			expect(page).to have_content("Status: Articles manquants")
		end
	end

end