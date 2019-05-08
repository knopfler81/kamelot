require 'rails_helper'

RSpec.describe Supplier do

	before(:each)do 
	nelly = create(:user, admin: true)
	login_as nelly
	end
	scenario "add a new supplier" do 
		visit new_admin_supplier_path

		fill_in "supplier[company]", with: "Stil Park"
		fill_in "supplier[address]", with: "Rue des polos"
		fill_in "supplier[city]", with: "Aubervilliers"
		fill_in "supplier[zipcode]", with: "93000"
		fill_in "supplier[phone_number]", with: "098765432"
		fill_in "supplier[email]", with: "shop@exmaple.com"

		click_on "Valider"
	end

	scenario "edit a supplier" do 
		sup = create(:supplier)
		visit edit_admin_supplier_path(sup)

		fill_in "supplier[company]", with: "Stil Park"
		fill_in "supplier[address]", with: "Rue des polos"
		fill_in "supplier[city]", with: "Aubervilliers"
		fill_in "supplier[zipcode]", with: "93000"
		fill_in "supplier[phone_number]", with: "098765432"
		fill_in "supplier[email]", with: "shop@exmaple.com"

		click_on "Valider"
	end

	context "visit a supplier page" do 
		scenario "with no stock yet" do 
			sup = create(:supplier, company: "Dupond")
			visit admin_supplier_path(sup)
			expect(page).to have_content("Vous n'avez rien acheté chez ce fournisseur")
		end
		
		scenario "with stock" do 
			sup = create(:supplier, company: "Blanc")
			stock = create(:stock, supplier_id: sup.id)
			visit admin_supplier_path(sup)
			expect(page).to have_content("Achats réalisé chez ce fournisseurs")
		end
	end
end