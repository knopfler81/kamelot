require 'rails_helper'


 RSpec.describe Order, type: :model do
	describe "#remove_from_stock" do 
		it "removes the numbers of articles ordered" do
			john   = create(:user)
	 		token  = 12345678
		 	current_cart ||= ShoppingCart.new(token: token)
			product   = create(:product, brand: "Side Park", title: "Chemise cool", price: 50, weight: 0.300)
			variant_s = create(:variant, product_id: product.id, size: "S")
			variant_m = create(:variant, product_id: product.id, size: "M")

			stock_s   = create(:stock, variant_id: variant_s.id, quantity: 6)
			stock_m   = create(:stock, variant_id: variant_m.id, quantity: 10)
			order     = create(:order, user_id: john.id)

			create(:order_item, order_id: order.id, quantity: 2, variant_id: variant_s.id, price: 20)
      create(:order_item, order_id: order.id, quantity: 1, variant_id: variant_m.id, price: 20)

			order.remove_from_stock

			expect(Stock.where(variant_id: variant_s.id).first.quantity).to eq(4)
			expect(Stock.where(variant_id: variant_m.id).first.quantity).to eq(9)
		end
 	end

 	describe "#set_total_weight!" do 
 		it "returns the total weight for all items" do 
			john   = create(:user)
	 		token  = 12345678
		 	current_cart ||= ShoppingCart.new(token: token)
			product   = create(:product, brand: "Side Park", title: "Chemise cool", price: 50, weight: 0.300)
			order     = create(:order, user_id: john.id)
			create(:order_item, order_id: order.id, quantity: 2)
      create(:order_item, order_id: order.id, quantity: 1)

			order.set_total_weight

			expect(order.total_weight).to eq(0.900)
 		end
 	end


 	describe "#sent_articles" do 
 		it "returns the numbers of shipped items" do 
 			order = create(:order, status: "pending")
 			item = create(:order_item, order_id: order.id, quantity: 5, missing_quantity: 1)

 			expect(order.sent_articles).to eq 4
 		end
 	end
end
