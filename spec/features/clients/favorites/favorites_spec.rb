require "rails_helper"

RSpec.describe Favorite do

	before(:each) do 
		john     = create(:user)
		login_as john
	end

	scenario "add a product to favorites", :js, :skip do 
		category = create(:category, title: "Tshirt")
		tshirt   = create(:product, brand: "Kaporal", category_id: category.id)
		
		visit clients_products_path
		
		first(".not-favorite").click

		visit clients_favorites_path

		expect(page).to have_content("KAPORAL")
	end 

	scenario "No favorite were added yet " do 

		visit clients_favorites_path
		expect(page).to have_content("Vous n'avez encore rien ajouté à votre liste de favoris")
	end
end