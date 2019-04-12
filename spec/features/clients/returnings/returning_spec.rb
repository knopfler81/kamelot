require 'rails_helper'

RSpec.describe Returning do

	scenario "Asking for a returning" do
		order  = create(:order, status: 3, return_asked: false)
		james  = create(:user)
		login_as(james)

		visit clients_order_path(order)
		
		expect(page).to have_button(value: "Demander un retour")
	end


	context "The returning is created" do 

		scenario "select the item he wants to send back" do 
			james 	= create(:user)
			login_as(james)
			order     = create(:order, status: 3, return_asked: true)
			returning = create(:returning, order_id: order.id)
			item      = create(:returning_item, returning_id: returning.id, selected: false)

			visit clients_order_returning_returning_items_path(order, returning)
			check :selected
			click_on "Continuer le retour"
			
			expect(page).to have_content("RETOUR - COMMANDE ##{order.id}")
		end

		scenario "add a reason to the returning" do 
			james 	 = create(:user)
			login_as(james)
			order     = create(:order, status: 3, return_asked: true)
			returning = create(:returning, order_id: order.id)
			item      = create(:returning_item, returning_id: returning.id, selected: true)

			visit edit_clients_order_returning_path(order, returning)

			fill_in "returning[reason]", with: "Some reasons...."

			click_on "Valider la demande de retour"
			expect(page).to have_content("Votre retour a été demandé")
		end
	end

	context "The returning is sent" do 
		scenario "user can not edit the returning" do 
			james 	= create(:user)
			login_as(james)
			order     = create(:order, status: 3, return_asked: true)
			returning = create(:returning, order_id: order.id, reason: "Some reason")
			item      = create(:returning_item, returning_id: returning.id, selected: true)

			visit edit_clients_order_returning_path(order, returning)

			expect(page).to have_content("La raison de votre retour :")
			expect(page).to have_content("Some reason")
		end
	end

end