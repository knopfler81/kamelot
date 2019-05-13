require 'rails_helper'

RSpec.describe Variant, type: :model do

	describe "#has_stock" do 
		it "returns true if stock is present" do 
			product = create(:product, brand: "Side Park", title: "Chemise cool", price: 50)
			variant_s = create(:variant, product_id: product.id, size: "S")
			variant_m = create(:variant, product_id: product.id, size: "M")
			stock_s   = create(:stock, variant_id: variant_s.id, quantity: 6)

			expect(variant_s.has_stock).to eq true
		end

		it "returns false if stock is not present" do 
			product = create(:product, brand: "Side Park", title: "Chemise cool", price: 50)
			variant_s = create(:variant, product_id: product.id, size: "S")
			variant_m = create(:variant, product_id: product.id, size: "M")

			expect(variant_m.has_stock).to eq false	
		end
	end

	describe "#remaining_stock" do 
		it "returns the remaining stock" do 
			product = create(:product, brand: "Side Park", title: "Chemise cool", price: 50)
			variant_s = create(:variant, product_id: product.id, size: "S")

			create(:stock, variant_id: variant_s.id, quantity: 6)
			create(:stock, variant_id: variant_s.id, quantity: 6)
			create(:stock, variant_id: variant_s.id, quantity: 6)

			expect(variant_s.remaining_stock).to eq 18
		end 
	end

	describe "#size_and_color" do 
		it "returns size and color" do 
			product = create(:product, brand: "Side Park", title: "Chemise cool", price: 50)
			variant_s = create(:variant, product_id: product.id, size: "S", color: "Verte")

			expect(variant_s.size_and_color).to eq "S - Verte"
		end

		it "returns only size" do 
			product = create(:product, brand: "Side Park", title: "Chemise cool", price: 50, color: "Rouge")
			variant_s = create(:variant, product_id: product.id, size: "S")

			expect(variant_s.size_and_color).to eq "S"
		end
	end
end
