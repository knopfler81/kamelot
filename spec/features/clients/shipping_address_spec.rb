require 'rails_helper'

RSpec.describe ShippingAddress do

	context "User has just signed up" do 
		scenario "skips the address form for now", js: true do 

      visit new_user_registration_path

			choose "Monsieur"
			fill_in "user[first_name]", with: "Benoit"
			fill_in "user[last_name]", with: "Durant"
			fill_in "user[birth_date]", with: "08/05/1981"
			fill_in "user[email]", with: "benoit@example.com"
			fill_in "user[email_confirmation]", with: "benoit@example.com"
			fill_in "user[password]", with: "password"
			fill_in "user[password_confirmation]", with: "password"

			click_on "Valider mon inscription"
<<<<<<< HEAD
<<<<<<< HEAD
			find('.btn-secondary', text: "Remplir plus tard").click
=======
			expect(page).to have_content("REMPLISSEZ VOTRE ADRESSE DE LIVRAISON")

			click_on "Remplir plus tard"
>>>>>>> 9eea437... spec pour shipping et billing
=======
			find('.btn-secondary', text: "Remplir plus tard").click
>>>>>>> 42ce42f... fix overlap

			expect(current_path).to eq root_path
		end

		scenario "fills in the address form" do 
			visit  root_path 
			find('#subscription').click

			choose "Monsieur"
			fill_in "user[first_name]", with: "Benoit"
			fill_in "user[last_name]", with: "Durant"
			fill_in "user[birth_date]", with: "08/05/1981"
			fill_in "user[email]", with: "benoit@example.com"
			fill_in "user[email_confirmation]", with: "benoit@example.com"
			fill_in "user[password]", with: "password"
			fill_in "user[password_confirmation]", with: "password"

			click_on "Valider mon inscription"
			fill_in "shipping_address[address_1]", with: "1 rue du muguet"
			fill_in "shipping_address[address_2]", with: "Bat A"
			fill_in "shipping_address[zipcode]", with: "42000"
			fill_in "shipping_address[city]", with: "Saint Etienne"
			fill_in "shipping_address[phone]", with: "0656432345"

			click_on "Valider"

			expect(page).to have_content("MES ADRESSES")		
		end

		scenario "edits the address form" do 
			user = create(:user)
			address = create(:shipping_address, user_id: user.id)
			login_as user
			visit clients_user_path(user)

			find("#edit_shipping").click

			fill_in "shipping_address[address_1]", with: "1 rue du muguet"
			fill_in "shipping_address[address_2]", with: "Bat A"
			fill_in "shipping_address[zipcode]", with: "42000"
			fill_in "shipping_address[city]", with: "Saint Etienne"
			fill_in "shipping_address[phone]", with: "0656432345"

			click_on("Valider")

			expect(page).to have_content("MES ADRESSES")		
		end
	end
end