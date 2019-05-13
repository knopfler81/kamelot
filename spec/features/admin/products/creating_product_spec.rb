require 'rails_helper'

RSpec.describe "Creating Product" do 

	context "As an admin I can" do 

		before(:each) do 
			nelly = create(:user, admin: true)
			company = create(:supplier, company: "Morrin")
			main   = create(:main_category)
			gillet = create(:category, title: "Gillet", main_category_id: main.id)
			login_as(nelly)
		end


		scenario "list all the products" do
			create(:product, brand: "YOLO")
			visit admin_products_path
			expect(page).to have_content('YOLO')
		end 

		scenario "Create a product" do 
			visit new_admin_product_path
			fill_in "product[brand]", with: "Side Park"
			fill_in "product[title]", with: "Gillet en laine"
			fill_in "product[price]", with: 50
			fill_in "product[buying_price]", with: 10
			fill_in "product[description]", with: "Une description pour ce gillet"
			fill_in "product[color]", with: "Noir"
			fill_in "product[ref]", with: "FF00"
			fill_in "product[weight]", with: 0.300
			select "Gillet",  from: "product[category_id]"
			select "Morrin", from: "product[supplier_id]"

			attach_file "product[attachments][]", Rails.root.join("spec/fixtures/product/attachments/pull_noir_1.jpg")

			click_on "Valider le produit"

			expect(page).to have_content("L'article a bien été créé")
		end


		scenario "Continue a product", js: true do 
			product = create(:product, brand: "Stil Park")
			visit edit_admin_product_path(product)

			click_on "Ajouter une autre variante"
			find('.nested-fields:nth-child(1)').fill_in "Taille",  with: "S"
			find('.nested-fields:nth-child(1)').fill_in "Couleur", with: "Bleu"

			click_on "Ajouter une autre variante"
		 	find('.nested-fields:nth-child(2)').fill_in "Taille",  with: "S"
		 	find('.nested-fields:nth-child(2)').fill_in "Couleur", with: "Vert"
			
			click_on "Mettre à jour l'article"

			expect(page).to have_content("Variante S - Bleu")
			expect(page).to have_content("Variante S - Vert")
		end

		scenario "Edit a product, adding text" do 
			product = create(:product, brand: "Stil Park")
			visit edit_admin_product_path(product)
			fill_in "product[brand]", with: "Enzo Di Capri"

			click_on "Mettre à jour l'article"

			expect(page).to have_content("Gestion du stock pour")
		end

		scenario "Edit a product, removing variant" do 
			product = create(:product, brand: "Stil Park")
			visit edit_admin_product_path(product)
			fill_in "product[brand]", with: "Enzo Di Capri"

			click_on "Mettre à jour l'article"

			expect(page).to have_content("Gestion du stock pour")
		end

		scenario "Duplicate a product" do 
			product = create(:product, brand: "Stil Park", title: "Polo")
			visit admin_product_path(product)
			click_on "Dupliquer cet article"

      expect(find_field("product[title]").value).to eq 'Polo'
			expect(find_field("product[brand]").value).to eq 'Stil Park'
      expect(page).to have_content("CREATION D'UN NOUVEL ARTICLE")
		end


	end
end