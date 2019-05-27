require 'rails_helper'

RSpec.describe "Product" do

	before(:each) do 
		Product.destroy_all
	end
	
	let!(:category) { create(:category, title: "TShirt")} 
	let!(:product)  { create(:product, category_id: category.id,price: 100, discount_percentage: 10, title: "Mariniere", color: "Bleue", brand: "Stil", description: "Blablabla joli blabla")} 
	let!(:variant)  { create(:variant, size: "L", product_id: product.id)} 
	let!(:stock)    { create(:stock, quantity: 3, variant_id: variant.id)} 
	
	context "not logged in user is looking for a product" do 
		scenario "clicking on tab item" do 
			visit root_path 
			click_on "TShirt"
			expect(page).to have_content("Stil")
			first(".box_link").click

			expect(page).to have_content("Mariniere - Stil")
			expect(page).to have_button("Ajouter Au Panier")
			expect(page).not_to have_link("Ajouter a mes favoris")
		end
	end

	context "logged in user is looking for a product" do 
		scenario "clicking on tab item" do 
			user = create(:user)
			login_as user
			visit root_path
			click_on "TShirt"
			expect(page).to have_content("Stil")
			first(".box_link").click

			expect(page).to have_content("Mariniere - Stil")
			expect(page).to have_button("Ajouter Au Panier")
			expect(page).to have_link("Ajouter a mes favoris")
		end
	end

	scenario "searching by title" do 
		visit root_path

		fill_in "query[keyword]", with: "Mariniere"
	  page.find("#search").click

		expect(page).to have_content("Stil")
	end

	scenario "searching by color" do 
		visit root_path

		fill_in "query[keyword]", with: "Bleu"
	  page.find("#search").click

		expect(page).to have_content("Stil")
	end

	scenario "searching by brand" do 
		visit root_path

		fill_in "query[keyword]", with: "Stil"
	  page.find("#search").click

		expect(page).to have_content("Stil")
	end

	scenario "searching by description" do 
		visit root_path

		fill_in "query[keyword]", with: "Joli"
	  page.find("#search").click

		expect(page).to have_content("Stil")
	end
  
  context "product with a discount" do 

  	it "displays the percentage" do
  		visit clients_products_path
  		expect(page).to have_content("- 10 %")
  	end

  	it "displays the old price" do
  		visit clients_products_path
  		expect(page).to have_content("100,00 €")
  	end

  	it "displays the new price" do
  		visit clients_products_path
  		expect(page).to have_content("90,00 €")
  	end

  	it "displays the old price" do
  		visit clients_products_path
  		first('.box_link').click
  		expect(page).to have_content("Prix de départ")
  		expect(page).to have_content("100,00 €")
  	end

  	it "displays the new price" do
  		visit clients_products_path
  		first('.box_link').click
  		expect(page).to have_content("Promo")
  		expect(page).to have_content("90,00 €")
  	end
  end
end
