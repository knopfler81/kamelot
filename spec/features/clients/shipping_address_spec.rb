require 'rails_helper'

RSpec.describe ShippingAddress do

	context "User has just signed up" do 
		scenario "skipping the address form for now", :js do 


			visit  root_path 

			find('a.dropdown-toggle').click 
			click_on("Inscription")
			save_and_open_page

			choose "Monsieur"
			fill_in "user[first_name]", with: "Benoit"
			fill_in "user[last_name]", with: "Durant"
			fill_in "user[birth_date]", with: "08/05/1981"
			fill_in "user[email]", with: "benoit@example.com"
			fill_in "user[email_confirmation]", with: "benoit@example.com"
			fill_in "user[password]", with: "password"
			fill_in "user[password_confirmation]", with: "password"

			click_on "Valider mon inscription"
			expect(page).to have_content("REMPLISSEZ VOTRE ADRESSE DE LIVRAISON")

			click_on "Remplir plus tard"

			expect(current_path).to eq root_path

	
		end
	end
end