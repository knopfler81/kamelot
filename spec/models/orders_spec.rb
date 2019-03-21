require 'rails_helper'


 RSpec.describe Order, type: :model do
 	

 	describe "#count_articles" do 
 		it "counts the numbers of similar articles" do 
 			john   = create(:user)
	 		token  = 12345678
		 	current_cart ||= ShoppingCart.new(token: token)
 			product = create(:product, brand: "Side Park", title: "Chemise cool", price: 50, weight: 0.300)
 			variant = create(:variant, product_id: product.id, size: "S")
 			stock   = create(:stock, variant_id: variant.id, quantity: 3)
 			order   = create(:order, user_id: john.id)

 			order_items_1 = create(:order_item, order_id: order.id, quantity: 2, variant_id: variant.id, price: 20)
 			
 			expect(order.count_articles).to eq 2
 		end
 	end

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
end
