require 'rails_helper'

RSpec.describe "Contact" do

	context "sending a valid message to the seller" do

		scenario "send a message to the seller" do 
			visit root_path
			click_on 'Contact'
			fill_in "contact[email]", with: "leclient@example.com"
			fill_in "contact[full_name]", with: "Durand"

			fill_in "contact[message_content]", with: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum saepe, dolorem veritatis consequatur? Aut doloribus quibusdam deleniti dolorem saepe, dolor commodi tempora rem ea asperiores, eaque, similique? Error, deleniti, delectus!"
			
			click_on "Envoyer le message"	

			expect(page).to have_content("Votre email a bien été envoyé")
		end
	end
end