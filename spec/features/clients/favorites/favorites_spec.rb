require "rails_helper"

RSpec.feature Favorite do 

	fixtures :users, :categories, :products

	before :each do 
		john = users(:john)
		login_as john
	end

	scenario "add a product to favorites", js: true do 
		nelly = users(:nelly)
		pull  = categories(:pull)
		ken = products(:warm_sweat)

		visit root_path

		page.all(".not-favorite")[1].click

		visit clients_favorites_path

		expect(page).to have_content("Pull Kenzaro")
	end 
end