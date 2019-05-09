require 'rails_helper'

RSpec.describe BillingAddress do

	scenario "add the address form" do 
		user = create(:user)
		login_as user
		visit clients_user_path(user)

		find("#add_billing").click

		fill_in "billing_address[address_1]", with: "1 rue du Lilas"
		fill_in "billing_address[address_2]", with: "Bat A"
		fill_in "billing_address[zipcode]", with: "42000"
		fill_in "billing_address[city]", with: "Saint Etienne"

		click_on("Valider")

		expect(page).to have_content("MES ADRESSES")		
	end

	scenario "edits the address form" do 
		user = create(:user)
		address = create(:billing_address, user_id: user.id)
		login_as user
		visit clients_user_path(user)

		find("#edit_billing").click

		fill_in "billing_address[address_1]", with: "1 rue du Lilas"
		fill_in "billing_address[address_2]", with: "Bat A"
		fill_in "billing_address[zipcode]", with: "42000"
		fill_in "billing_address[city]", with: "Saint Etienne"

		click_on("Valider")

		expect(page).to have_content("MES ADRESSES")		
	end
end