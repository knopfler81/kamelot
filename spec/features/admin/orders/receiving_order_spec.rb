require 'rails_helper'

RSpec.describe Order do 
	before(:each) do
		nelly   = create :user, admin: true 
		login_as nelly
	end

	context "Ordered items are in stock" do 
		scenario "Admin prepare the order" do
			user    = create :user 
			address = create :shipping_address, user_id: user.id
			order = create(:order, user_id: user.id, status: "paid")

			visit admin_order_path(order)

			click_on "Confirmer la prise en charge"

			expect(page).to have_content("En cours de préparation")
		end

		scenario "Admin send the order" do
			user    = create :user 
			address = create :shipping_address, user_id: user.id
			order = create(:order, user_id: user.id, status: "confirmed")

			visit admin_order_path(order)

			click_on "Commande expédiée"

			expect(page).to have_content("Commande envoyée dans sa totalité")
		end
	end

	context "Some items are missing" do 
		scenario "Select the missing items", :js do  
			user    = create :user 
			address = create :shipping_address, user_id: user.id
			order = create(:order, user_id: user.id, status: "paid")
			item_1 = create(:order_item, quantity: 3, order_id: order.id, missing_quantity: 0)


			visit admin_order_path(order)

			click_on "Signaler article(s) manquant(s)"

			expect(page).to have_content("Séléctionnez les articles qui ne sont plus disponibles")
	
			select "2", from: "missing_quantity"
		
			click_on "Confirmer et prévenir le client"

			expect(page).to have_content("Articles manquants")
		end
	end

end