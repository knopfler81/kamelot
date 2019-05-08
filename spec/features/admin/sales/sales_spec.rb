
require 'rails_helper'

RSpec.describe "Sales" do 

	before(:each) do
		@nelly     = create :user, admin: true 
		@shirt     = create :product, title: "Shirt", price: "30"
		@pull      = create :product, title: "Pull", price: "30"
		@variant_S = create :variant, size: "S" , product_id: @shirt.id, color: nil
		@variant_M = create :variant, size: "M" , product_id: @pull.id, color: nil
    @stock_S   = create :stock, variant_id: @variant_S.id, quantity: 3, price: @shirt.price
		@stock_M   = create :stock, variant_id: @variant_M.id, quantity: 3, price: @pull.price
		login_as @nelly
	end

	context "admin sells items" do 
		scenario "the basket is empty" do
			visit admin_basket_path

			expect(page).to have_content("Votre panier est vide")
		end

		scenario "add item in the basket" do

			visit admin_product_path(@shirt)

			select "S", from: "variant_id"

			click_on "Ajouter Au Panier"

			expect(page).to have_content("MON PANIER")
		end

		scenario "confirm sale" do 
			visit admin_product_path(@shirt)

			select "S", from: "variant_id"

			click_on "Ajouter Au Panier"

			click_on "Encaisser"

			expect(page).to have_content("VALIDATION DE LA VENTE")
			expect(page).to have_content("30,00 €")
		end

		scenario "cash sale" do 
			visit admin_product_path(@shirt)

			select "S", from: "variant_id"

			click_on "Ajouter Au Panier"

			click_on "Encaisser"

			click_on "Confirmer la vente"

			expect(current_path).to eq admin_sales_path
		end

	end

end
