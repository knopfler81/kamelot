require 'rails_helper'

RSpec.describe "Shipped Order" do 

	before(:each) do
		nelly    = create :user, admin: true 
		login_as nelly
		@user    = create :user, first_name: "John", last_name: "Wayne"
		address  = create :shipping_address, user_id: @user.id, address_1: "Rue du Soleil", city: "Lyon", zipcode: "69000", phone: "0677777777"
		@order   = create :order, user_id: @user.id, created_at: "2019-05-02"
	end

	# describe  "The order is finished" do 

		it "shows the adress street " do 
			visit clients_order_path(@order)

			expect(page).to have_content('Rue du Soleil')
		end

		it "shows the adress city " do 
			visit clients_order_path(@order)

			expect(page).to have_content('Lyon')
		end

		it "shows the user's full name " do 
			visit clients_order_path(@order)

			expect(page).to have_content('John Wayne')
		end

		it "shows the user's phone number " do 
			visit clients_order_path(@order)

			expect(page).to have_content('0677777777')
		end

		it "shows that the order was totally sent" do
			@order   = create :order, user_id: @user.id, status: "full_shipped"
			visit clients_order_path(@order)

			expect(page).to have_content('Commande envoyée dans sa totalité')
		end

		it "shows that the order was partly sent" do
			@order   = create :order, user_id: @user.id, status: "partly_shipped"
			visit clients_order_path(@order)

			expect(page).to have_content('Commande envoyée en partie')
		end

		it "shows the date the order was created" do
			visit clients_order_path(@order)

			expect(page).to have_content('Commande passée le 02 mai 2019')
		end
	# end

	describe "User wants to return article" do 

		it "does not show a link to return items" do
			@order = create :order, user_id: @user.id, status: "full_shipped", created_at: 2.months.ago
			@order.update_attributes!(return_limit_date: 1.month.ago)
			
			visit clients_order_path(@order)
			
			expect(page).to_not have_button('Demander un retour')
		end
		it "shows a link to return items" do
			@order   = create :order, user_id: @user.id, status: "full_shipped", created_at: Date.today, return_limit_date: 10.days.from_now
			visit clients_order_path(@order)
			
			expect(page).to have_button('Demander un retour')
		end

	end
end