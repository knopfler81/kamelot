require "rails_helper"

RSpec.describe Favorite do 

	scenario "add a product to favorites", js: true do 
		category = create(:category, title: "Tshirt")
		tshirt   = create(:product, brand: "Kaporal", category_id: category.id)
		john     = create(:user)
		login_as john

		visit clients_products_path

		first(".not-favorite").click

		visit clients_favorites_path

		expect(page).to have_content("KAPORAL")
	end 
end