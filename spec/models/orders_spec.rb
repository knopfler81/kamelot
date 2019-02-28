require 'rails_helper'


 RSpec.describe Order, type: :model do
 	

 	describe "#count_articles" do 
 		it "counts the numbers of similar articles" do 
 			john   = create(:user)
	 		token  = 12345678
		 	current_cart ||= ShoppingCart.new(token: token)
 			product = create(:product, brand: "Side Park", title: "Chemise cool", price: 50)
 			variant = create(:variant, product_id: product.id, size: "S")
 			stock   = create(:stock, variant_id: variant.id, quantity: 3)
 			order   = create(:order, user_id: john.id)

 			order_items_1 = create(:order_item, order_id: order.id, quantity: 2, variant_id: variant.id, price: 20)
 			
 			expect(order.count_articles).to eq 2
 		end
 	end

end
