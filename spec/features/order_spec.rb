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

	context "A user with a completed profile" do 
		scenario "can checkout" do
			john 	= users(:john)
			pull  = categories(:pull)
			nelly = users(:nelly)
			ken   = Product.create(category_id: pull.id ,
							user_id: nelly.id, 
							title: "Pull",
							description: "Blabla",
							price: 40,
							color: "Rouge", 
							sizes_attributes: [size_name: "S", quantity: 10])
			login_as(john)

			visit product_path(ken)
			find("#quantity").set 2
			select "S", from: "size_id"

			click_on "Add to Cart"
			expect(page).to have_content("Correctement ajouté au panier")
			click_on "Checkout"

			expect(page).to have_content("Règlement")
		end
	end

	context "A user without a completed profile" do 
		scenario "is asked to compelte his profile before checking out" do
			mark 	= users(:mark)
			pull  = categories(:pull)
			nelly = users(:nelly)
			ken   = Product.create(category_id: pull.id ,
							user_id: nelly.id, 
							title: "Pull",
							description: "Blabla",
							price: 40,
							color: "Rouge", 
							sizes_attributes: [size_name: "S", quantity: 10])
			login_as(mark)

			visit product_path(ken)
			find("#quantity").set 2
			select "S", from: "size_id"

			click_on "Add to Cart"
			expect(page).to have_content("Correctement ajouté au panier")
			click_on "Checkout"
	
			expect(page).to have_content("Complètez vos coordonnées")
		end
	end
end