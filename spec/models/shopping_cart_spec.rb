require 'rails_helper'

 RSpec.describe ShoppingCart, type: :model do
 	
 	before(:each) do 
 		@shirt  = create(:product)
 		@small  = create(:variant, size: "S")
 		@large  = create(:variant, size: "L")
 		@stock_1  = create(:stock, variant_id: @small.id, price: 59)
 		@stock_2  = create(:stock, variant_id: @large.id, price: 59)
 		@john   = create(:user)
 		@token  = 12345678
	 	@current_cart ||= ShoppingCart.new(token: @token)
	 	@order  = create( :order, user_id: @john.id, token: @token, status: "ongoing", sub_total: 80)
	 end

 	describe ".items_count" do 
 		it "render the number of items" do 
	 		order_items_1 = create(:order_item, order_id: @order.id, quantity: 2, variant_id: @small.id, price: 20)
	 		order_items_2 = create(:order_item, order_id: @order.id, quantity: 4, variant_id: @large.id, price: 20)

	 		expect(@current_cart.items_count).to eq(6)
 		end
 	end


 	describe ".add_item" do 
 		it 'add item to the cart' do 
 			@current_cart.add_item(quantity: 1, variant_id: @large.id )
	 		@current_cart.add_item(quantity: 2, variant_id: @small.id )

	 		expect(@current_cart.items_count).to eq(3)
	 	end
 	end

 	describe ".remove_item" do 
 		it 'remove item from the cart' do 
 			order_items = create(:order_item, order_id: @order.id, quantity: 2, variant_id: @small.id, price: 20)

 			@current_cart.remove_item(id:  order_items.id)
	 		expect(@current_cart.sub_total).to eq 0
	 	end
 	end
end
