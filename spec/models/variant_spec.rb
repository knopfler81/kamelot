require 'rails_helper'

RSpec.describe Variant, type: :model do

	describe "#has_stock" do 
		it "returns if stock is present or not" do 
			product = create(:product, brand: "Side Park", title: "Chemise cool", price: 50)
			variant_s = create(:variant, product_id: product.id, size: "S")
			variant_m = create(:variant, product_id: product.id, size: "M")
			stock_s   = create(:stock, variant_id: variant_s.id, quantity: 6)

			expect(variant_s.has_stock).to eq true
			expect(variant_m.has_stock).to eq false	
		end
	end
end
