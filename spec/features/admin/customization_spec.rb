require 'rails_helper'

RSpec.describe Customization do

	context "creating a customization" do 
	

		before(:each) do
			user = create(:user, admin: true)
			login_as user
			visit admin_customization_path
		end	

		it "add the text to delivery" do
			fill_in "Livraison", with: "Les livraisons sont assurées par"
			click_on "Valider la customization"

			visit clients_delivery_path 
			expect(page).to have_content("Les livraisons sont assurées par")
		end

		it "add the text to secure payment" do
			fill_in "Paiement sécurisé", with: "Les paiements sont sécurisés"
			click_on "Valider la customization"

			visit clients_secure_payment_path 
			expect(page).to have_content("Les paiements sont sécurisés")
		end

		it "add the text to general condition of sales" do
			fill_in "Conditions générales de ventes", with: "Les conditions générales de ventes sont blabla"
			click_on "Valider la customization"

			visit clients_general_condition_of_sales_path 
			expect(page).to have_content("Les conditions générales de ventes sont blabla")
		end

		it "add the text to legal notice" do
			fill_in "Mentions légales", with: "Les mentions légales sont blabla"
			click_on "Valider la customization"

			visit clients_legal_notice_path 
			expect(page).to have_content("Les mentions légales sont blabla")
		end

		it "add the text to confidentiality policy" do
			fill_in "Politique de confidentialité", with: "La politique de confidentialité, etc"
			click_on "Valider la customization"

			visit clients_confidentiality_policy_path 
			expect(page).to have_content("La politique de confidentialité, etc")
		end

		it "add the text to cookies policy" do
			fill_in "Politique des cookies", with: "La politique des cookies, yummy"
			click_on "Valider la customization"

			visit clients_cookies_policy_path
			expect(page).to have_content("La politique des cookies, yummy")
		end


		it "add text to main image text" do 
			polo    = create(:category, title: "Polos")
			product = create(:product, category_id: polo.id,)

			fill_in "customization[text_main_image]", with: "Les polos sont arrivés"
			fill_in "customization[text_btn_main_image]", with: "J'en veux"
			fill_in "customization[main_link]", with: '/clients/categories/polos'
			click_on "Valider la customization"

			visit root_path 
			expect(page).to have_content("Les polos sont arrivés")
			expect(page).to have_content("J'en veux")
			click_link "J'en veux"
			
			expect(page).to have_content("LES POLOS")
		end

	end
end