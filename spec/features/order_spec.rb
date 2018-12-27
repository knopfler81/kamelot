require 'rails_helper'


RSpec.describe Order do 

	fixtures :users, :categories, :products, :sizes

	context "A not logged in user" do 
		scenario "is redirect to the sign up form before adding article in his basket" do
			product = products(:red_shirt)	

			visit product_path(product)
			click_on "Ajouter"
			expect(page).to have_content("Connexion")
		end
	end

	context "A logged in user without a completed profile" do 
		before(:each) do 
			visit new_user_session_path
			fill_in "user[email]", with: "john@example.com"
			fill_in "user[password]", with: "password"
			click_on 'Log in'
		end

		scenario "add an article in his basket" do
			pull  = categories(:pull)
			nelly = users(:nelly)
			ken   = Product.create(category_id: pull.id ,
							user_id: nelly.id, 
							title: "Pull",
							description: "Blabla",
							price: 40,
							color: "Rouge", 
							sizes_attributes: [size_name: "S", quantity: 10])

			visit product_path(ken)
			find("#quantity").set 2
			select "S", from: "size_id"

			click_on "Add to Cart"
			expect(page).to have_content("Correctement ajouté au panier")
		end
	end

end