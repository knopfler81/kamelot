require 'rails_helper'


RSpec.describe Sale, type: :model do
 	
 	describe "#remove_from_stock" do 
		it "removes the numbers of articles sold" do
			john   = create(:user)
	 		token  = 12345678
		 	current_basket ||= VendingBasket.new(token: token)
			product   = create(:product, brand: "Side Park", title: "Chemise cool", market_price: 50)
			variant_s = create(:variant, product_id: product.id, size: "S")
			variant_m = create(:variant, product_id: product.id, size: "M")

			stock_s   = create(:stock, variant_id: variant_s.id, quantity: 6,  market_price: product.market_price)
			stock_m   = create(:stock, variant_id: variant_m.id, quantity: 10, market_price: product.market_price)
			sale      = create(:sale, user_id: john.id)

			create(:sale_item, sale_id: sale.id, quantity: 2, variant_id: variant_s.id, market_price: 20)
      create(:sale_item, sale_id: sale.id, quantity: 1, variant_id: variant_m.id, market_price: 20)

			sale.remove_from_stock

			expect(Stock.where(variant_id: variant_s.id).first.quantity).to eq(4)
			expect(Stock.where(variant_id: variant_m.id).first.quantity).to eq(9)

		end

 	end
end