require 'rails_helper'

RSpec.describe "Cancel an Order" do 

	before(:each) do
		nelly   = create :user, admin: true 
		login_as nelly
		@user    = create :user 
		address = create :shipping_address, user_id: @user.id
	end


	describe "User want to cancel his order" do 

		it 'allows the cancellation when order is pending' do
			@order   = create :order, user_id: @user.id, status: 'pending'

			visit clients_order_path(@order)

			click_on "Annuler ma commande"
			expect(page).to have_content('Annulée par le client')
		end

		it 'does not allow the cancellation after order is confirmed' do
			@order   = create :order, user_id: @user.id, status: 'confirmed'

			visit clients_order_path(@order)

			expect(page).to_not have_button("Annuler ma commande")
		end
	end

	describe "The order is cancelled" do 
		it "shows that the order was cancelled by admin" do
			@order   = create :order, user_id: @user.id, status: "cancelled_by_admin"
			visit clients_order_path(@order)

			expect(page).to have_content('Annulée par le vendeur')
		end

		it "shows that the order was cancelled by client" do
			@order   = create :order, user_id: @user.id, status: "cancelled_by_client"
			visit clients_order_path(@order)

			expect(page).to have_content('Annulée par le client')
		end
	end
end