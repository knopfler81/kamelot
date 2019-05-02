
require 'rails_helper'

RSpec.describe "Receiving An Order" do 

	before(:each) do
		nelly   = create :user, admin: true 
		login_as nelly
		@user    = create :user 
		address = create :shipping_address, user_id: @user.id
		@charge  = Stripe::Charge.create(customer: @user.id, amount: 30, currency: "eur", captured: false)
	end

	context "Order states displays following text" do 

		scenario "the order has just arrived" do 
			@order  = create(:order, user_id: @user.id, status: "pending")

			visit admin_order_path(@order)
			expect(page).to have_button("Confirmer la prise en charge")
		end

		scenario "the order is confirmed then paid" do 
			order  = create(:order, user_id: @user.id, status: "paid")

			visit admin_order_path(order)
			expect(page).to have_link("Créer le colissimo")
		end

		scenario "the order is partly shipped" do 
			order  = create(:order, user_id: @user.id, status: "partly_shipped")

			visit admin_order_path(order)
			expect(page).to have_content("Commande envoyée en partie")
		end

		scenario "the order is fully shipped" do 
			order  = create(:order, user_id: @user.id, status: "full_shipped")

			visit admin_order_path(order)

			expect(page).to have_content("Commande envoyée dans sa totalité")
		end

	end

	context "All ordred articles are in stock" do

		scenario "preparing the order" do
			order   = create(:order, user_id: @user.id, status: "pending", charge_id: @charge.id)
	
			visit admin_order_path(order)
 		click_button "Confirmer la prise en charge"

			expect(page).to have_link("Créer le colissimo")
		end

		scenario "sending the order" do
			order   = create(:order, user_id: @user.id, status: "paid")

			visit admin_order_path(order)

			click_on "Commande expédiée"

			expect(page).to have_content("Commande envoyée dans sa totalité")
		end
	end

	context "Not all ordered articles are in stock" do

		before(:each) do 
			@order   = create(:order, user_id: @user.id, status: "pending", charge_id: @charge.id)
		end
		
		scenario "display the order state 'Etat de la commande: ", :js do
			items   =  create(:order_item, quantity: 3, order_id: @order.id, missing_quantity: 0) 
			visit admin_order_path(@order)

			click_on "Signaler article(s) manquant(s)"
			select "2", from: "missing_quantity"
			click_on "Confirmer et prévenir le client"
			
			expect(page).to have_content("Réglement au prorata")
		end


		scenario "shipping available items" do 
			@order   = create(:order, user_id: @user.id, status: "partly_paid", charge_id: @charge.id)
			visit admin_order_path(@order)
			click_on "Commande expédiée"
			expect(page).to have_content("Commande envoyée en partie")
		end
	end


	context "All items are missing" do 
		scenario "reporting missing items", :js do
			@order   = create(:order, user_id: @user.id, status: "pending", charge_id: @charge.id)
			items   =  create(:order_item, quantity: 3, order_id: @order.id, missing_quantity: 0) 
			
			visit admin_order_path(@order)

			click_on "Signaler article(s) manquant(s)"
			select "3", from: "missing_quantity"
			click_on "Confirmer et prévenir le client"
			
			expect(page).to have_content("Paiement non débité")
			expect(page).to have_content("Annulée par le vendeur")
		end
	end
end