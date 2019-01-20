require 'rails_helper'

 RSpec.describe ShoppingCart, type: :model do
 	fixtures :products, :users, :sizes
 	
 	before(:each) do 
 		@shirt  = products(:blue_shirt)
 		@small  = sizes(:small_blue_shirt)
 		@large  = sizes(:large_blue_shirt)
 		@john = users(:john)
 		@token  = 12345678
	 	@current_cart ||= ShoppingCart.new(token: @token)
	 	@order  = Order.create(user_id: @john.id, token: @token, status: "pending", sub_total: 80)
	 end

 	describe ".items_count" do 
 		it "render the number of items" do 
	 		order_items_1 = OrderItem.create(order_id: @order.id, product_id: @shirt.id , quantity: 2, size_id: @small.id, price: 20)
	 		order_items_2 = OrderItem.create(order_id: @order.id, product_id: @shirt.id , quantity: 4, size_id: @large.id, price: 20)

	 		expect(@current_cart.items_count).to eq(6)
 		end
 	end


 	describe ".add_item" do 
 		it 'add item to the cart' do 
 			@current_cart.add_item(quantity: 1, size_id: @large.id, product_id: @shirt.id)
	 		@current_cart.add_item(quantity: 2, size_id: @small.id, product_id: @shirt.id)

	 		expect(@current_cart.items_count).to eq(3)
	 	end
 	end

 	describe ".remove_item" do 
 		it 'remove item from the cart' do 
 			order_items = OrderItem.create(order_id: @order.id, product_id: @shirt.id , quantity: 2, size_id: @small.id, price: 20)

 			@current_cart.remove_item(id:  order_items.id)
	 		expect(@current_cart.sub_total).to eq 0
	 	end
 	end
end
