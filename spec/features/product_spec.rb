require 'rails_helper'


RSpec.describe Product do 

	fixtures :users, :categories, :products, :sizes

	context "As an admin I can" do 

		before(:each) do 
			login_as :admin
		end

		scenario "Create a product", :js do 
			visit new_product_path
			fill_in "product[title]", with: "Pull"
			fill_in "product[price]", with: 50
			fill_in "product[description]", with: "Une description "
			fill_in "product[color]", with: "Noir"
			select 'Pull', from: "product[category_id]"
			click_on "Ajouter une taille"
			find('.nested-fields:nth-child(1)').fill_in "Taille", with: "S"
			find('.nested-fields:nth-child(1)').fill_in "Quantité dans cette taille", with: 10
			
			click_on "Ajouter une taille"
			find('.nested-fields:nth-child(2)').fill_in "Taille", with: "M"
			find('.nested-fields:nth-child(2)').fill_in "Quantité dans cette taille", with: 9
			click_on "Valider le produit"

			expect(page).to have_content("Créé avec succès")
		end


		scenario "Edit a product" do 
			nelly = users(:nelly)
			pull  = categories(:pull)
			ken   = Product.create(category_id: pull.id ,
										user_id: nelly.id, 
										title: "Pull",
										description: "Blabla",
										price: 40,
										color: "Rouge", 
										sizes_attributes: [size_name: "S", quantity: 10])

			visit edit_product_path(ken)

			fill_in "product[color]", with: "Noir"
			fill_in "product[description]", with: "Une nouvelle description "

			click_on("supprimer cette taille")

			click_on "Valider le produit"
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

	#Il faut remettre Pundit avant de rétablir ces tests
	context "User is not admin", :skip do 
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