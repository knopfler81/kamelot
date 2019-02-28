require "rails_helper"

RSpec.describe Favorite do 

	scenario "add a product to favorites", js: true do 
		john = create(:user)
		login_as john
		create(:product, brand: "Side Park")

		visit clients_products_path

		first(".not-favorite").click

		visit clients_favorites_path

		expect(page).to have_content("Side Park")
	end 
end