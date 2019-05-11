
require 'rails_helper'

RSpec.describe Order do 

	before(:each) do
		nelly   = create :user, admin: true 
		login_as nelly
	end


	scenario "List of all the order" do 
		visit admin_orders_path

		expect(page).to have_content("LES COMMANDES INTERNET")
	end

	context "Filter order by status" do 
		before(:each) do 
			@lili = create(:user, first_name: "Lili", last_name: "Theboycat")
			@lewis = create(:user, first_name: "Lewis", last_name: "Thegirlcat")
		end
		scenario "it shows only order with 'pending' status", :js do 
			
			order_1 = create(:order, status: "pending", user_id: @lili.id)
			visit admin_orders_path

			select "En attente", from: "status"

			expect(page).to have_content('En attente')
			expect(page).to have_content('Lili')
		end

		scenario "it shows only order with 'confirmed' status", :js do 
			
			order_1 = create(:order, status: "confirmed", user_id: @lewis.id)
			visit admin_orders_path

			select "En cours de préparations", from: "status"

			expect(page).to have_content('En cours de préparation')
			expect(page).to have_content('Lewis')
		end

		scenario "it shows only order with 'paid' status", :js do 
			
			order_1 = create(:order, status: "paid", user_id: @lewis.id)
			visit admin_orders_path

			select "Payée", from: "status"

			expect(page).to have_content('Payée')
			expect(page).to have_content('Lewis')
		end

		scenario "it shows only order with 'partly shipped' status", :js do 
			
			order_1 = create(:order, status: "partly_shipped", user_id: @lili.id)
			visit admin_orders_path

			select "Commande envoyée en partie", from: "status"

			expect(page).to have_content('Commande envoyée en partie')
			expect(page).to have_content('Lili')
		end

		scenario "it shows only order with 'full shipped' status", :js do 
			order_1 = create(:order, status: "full_shipped", user_id: @lili.id)
			order_2 = create(:order, status: "full_shipped", user_id: @lewis.id)
			visit admin_orders_path

			select "Commande envoyée dans sa totalité", from: "status"

			expect(page).to have_content('Commande envoyée dans sa totalité')
			expect(page).to have_content('Lili')
			expect(page).to have_content('Lewis')
		end

		scenario "it shows only order with 'cancelled by client' status", :js do 
			order_1 = create(:order, status: "cancelled_by_client", user_id: @lili.id)
			order_2 = create(:order, status: "cancelled_by_client", user_id: @lewis.id)
			visit admin_orders_path

			select "Annulées par le client", from: "status"

			expect(page).to have_content('Annulée par le client')
			expect(page).to have_content('Lili')
			expect(page).to have_content('Lewis')
		end

		scenario "it shows only order with 'cancelled by admin' status", :js do 
			order_1 = create(:order, status: "cancelled_by_admin", user_id: @lili.id)
			order_2 = create(:order, status: "cancelled_by_admin", user_id: @lewis.id)
			visit admin_orders_path

			select "Annulées par le vendeur", from: "status"

			expect(page).to have_content('Annulée par le vendeur')
			expect(page).to have_content('Lili')
			expect(page).to have_content('Lewis')
		end

		scenario "it find an order by user's first name", :js do 
			order_1 = create(:order, user_id: @lili.id)
			order_2 = create(:order, user_id: @lewis.id)
			visit admin_orders_path

			fill_in "Rechercher par nom", with: "Lili"

			
			expect(page).to have_content('Thegirlcat')
			
		end

		scenario "it find an order by user's last name", :js do 
			order_1 = create(:order, user_id: @lili.id)
			order_2 = create(:order, user_id: @lewis.id)
			visit admin_orders_path

			fill_in "Rechercher par nom", with: "Thegirlcat"

			expect(page).to have_content('Lili')	
		end
	end
end