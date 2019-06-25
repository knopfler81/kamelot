require "rails_helper"

RSpec.describe Stock do 

	before(:each) do 
		Stock.destroy_all
		nelly = create(:user, admin: true)
		@supplier = create(:supplier, company: "Skull")
		login_as nelly
	end

	scenario "adding new stock to variant" do 
		product = create(:product, supplier_id: @supplier.id)
		variant = create(:variant, product_id: product.id, size: "S")
		stock  = create(:stock, variant_id: variant.id, quantity: 2)
		visit stock_admin_product_path(product)

		fill_in  "stock[quantity]", with: 10
		click_on "Mettre à jour le stock"		
		expect(page).to have_content "12 unités"

	end

	scenario "adding new stock and change supplier to variant" do 
		product = create(:product, supplier_id: @supplier.id)
		variant = create(:variant, product_id: product.id, size: "L")
		visit stock_admin_product_path(product)

		fill_in  "stock[quantity]", with: 10
		select "Skull", from: "stock[supplier_id]"
		click_on "Mettre à jour le stock"

		visit admin_stocks_path 
    expect(page).to have_content("Skull")
	end

	scenario "visit the stocks list" do 
		product = create(:product, title: "Blouson", brand: "Nike")
		variant = create(:variant, product_id: product.id, size: "L")
		sup     = create(:supplier, company: "Roses")
		stock_1 = create(:stock, variant_id: variant.id, price: 30, supplier_id: @supplier.id)
		stock_2 = create(:stock, variant_id: variant.id, price: 20, supplier_id: sup.id, updated_at: Time.now)

		visit admin_stocks_path 

    expect(page).to have_content("Skull")
    expect(page).to have_content("Roses")
	end
end