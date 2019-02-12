require "rails_helper"

RSpec.feature Favorite do 

	fixtures :users, :categories, :products

	before :each do 
		john = users(:john)
		login_as john
	end

	scenario "add a product to favorites", js: true do 
		pull  = categories(:pull)
		ken = products(:warm_sweat)

		visit clients_products_path

		first(".not-favorite").click

		visit clients_favorites_path

		expect(page).to have_content("Side Park")
	end 
end