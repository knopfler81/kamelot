require 'rails_helper'


 RSpec.describe Order, type: :model do
 	
 	fixtures :products, :users, :sizes

 	 	before(:each) do 
 	 		@shirt  = products(:red_shirt)
 	 		@small  = sizes(:small_red_shirt)
 	 		@large  = sizes(:large_red_shirt)
 	 		@john = users(:john)
 	 		@token  = 12345678
 		 	@current_cart ||= ShoppingCart.new(token: @token)
 		 	@order  = Order.create(user_id: @john.id, token: @token, status: "pending", sub_total: 80)
 		 end

 	describe "#count_articles" do 
 		it "counts the numbers of similar articles" do 
 			order_items_1 = OrderItem.create(order_id: @order.id, product_id: @shirt.id , quantity: 2, size_id: @small.id, price: 20)
			order_items_2 = OrderItem.create(order_id: @order.id, product_id: @shirt.id , quantity: 3, size_id: @large.id, price: 20)
 			
 			expect(@order.count_articles).to eq 5
 		end
 	end

end
