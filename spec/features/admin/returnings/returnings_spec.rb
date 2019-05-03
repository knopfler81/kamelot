require 'rails_helper'

RSpec.describe "Returnings" do 

	before(:each) do 
		user           = create(:user, first_name: "Mathéo", last_name: "Leroux")
		@order         = create(:order, created_at: "2019-04-20", return_asked: true)
		variant        = create(:variant)
		item           = create(:order_item, order_id: @order.id, quantity: 3)
		@returning_1   = create(:returning, status: "pending", user_id: user.id, limit_date: "2019-05-02", order_id: @order.id, reason: "C'est trop petit")
		@returning_2   = create(:returning, status: "confirmed")
		@returning_3   = create(:returning, status: "refunded")
		returning_item = create(:returning_item, quantity: 1, selected: true, variant_id: variant.id, price: 40, order_item_id: item.id, returning_id: @returning_1.id)
		nelly          = create :user, admin: true
		login_as nelly
	end
	context "returings have been asked" do

		it "displays all the returnings" do 
			visit admin_returnings_path

			expect(page).to have_content("En attente")
			expect(page).to have_content("Retour réceptionné")
			expect(page).to have_content("Remboursé")
		end
	end

	context "showing a returning" do 
		it "display the client's full name" do 
 			visit admin_returning_path(@returning_1)
 			
 			expect(page).to have_content("Mathéo Leroux")
 		end

		it "displays the order's date and returning's limit date" do 
 			visit admin_returning_path(@returning_1)
 			
 			expect(page).to have_content("2 mai 2019")
 			expect(page).to have_content("20 avril 2019")
 		end

 		it "displays the client's reason" do 
 			visit admin_returning_path(@returning_1)

 			expect(page).to have_content("C'est trop petit")
 		end

 		it "displays the amount to refund" do 
 			visit admin_returning_path(@returning_1)

 			expect(page).to have_content("Total à rembourser: 40,00 €")
 		end
	end

	context "displaying the returing's state" do 

		it "says the order is pending" do
			visit admin_returning_path(@returning_1)
			
			expect(page).to have_content("En attente")
		end

		it "says the order has arrived" do
			visit admin_returning_path(@returning_2)
			
			expect(page).to have_content("Retour réceptionné")
		end

		it "says the order has been refunded" do
			visit admin_returning_path(@returning_3)
			
			expect(page).to have_content("Remboursé")
		end
	end
end