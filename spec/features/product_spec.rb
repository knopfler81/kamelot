require 'rails_helper'


RSpec.describe Product do 

	fixtures :users, :categories, :products

	context "As an admin I can" do 

		before(:each) do 
			login_as :admin
		end

		scenario "Create a product" do 
			visit new_product_path
			fill_in "product[title]", with: "Pull"
			fill_in "product[price]", with: 50
			fill_in "product[description]", with: "Une description "
			fill_in "product[quantity]", with: "5"
			fill_in "product[color]", with: "Noir"
			select 'XL', from: "product[size]"
			select 'Pull', from: "product[category_id]"
			click_on "Ajouter"
			expect(page).to have_content("Créé avec succès")
		end


		scenario "Edit a product" do 
			ken = products(:black_k_l)

			visit edit_product_path(ken)

			select 'XL', from: "product[size]"
			click_on "Ajouter"
			expect(page).to have_content("Modifié avec succès")
		end

		scenario "Destroy a product" do 
			ken = products(:black_k_l)
			pull = categories(:pull)

			visit product_path(ken)

			
			find(".delete_product").click

			expect(page).to have_content("Supprimé avec succès")		
		end
	end	

	context "User is not admin" do 
		before(:each) do 
			visit new_user_session_path
			fill_in "user[email]", with: "guest@example.com"
			fill_in "user[password]", with: "password"
			click_on 'Log in'
		end

		scenario "Create a product" do 
			visit "products/new" 
			expect(page).to have_content("You are not authorized to perform this action.")
		end

		scenario "Edit a product" do 
			product = products(:black_k_l)
			visit edit_product_path(product)
			expect(page).to have_content("You are not authorized to perform this action.")
		end
	end
end