require 'rails_helper'

 RSpec.describe VendingBasket, type: :model do
 	
 	before(:each) do 
 		Stock.destroy_all
 		@shirt    = create(:product)
 		@small    = create(:variant, size: "S")
 		@large    = create(:variant, size: "L")
 		@stock_1  = create(:stock, variant_id: @small.id, price: 59, quantity: 5)
 		@stock_2  = create(:stock, variant_id: @large.id, price: 59, quantity: 5)
 		@john     = create(:user, admin: true)
 		@token    = 12345678
	 	@current_basket ||= VendingBasket.new(token: @token)
	 	@sale     = create( :sale, user_id: @john.id, token: @token, status: "pending", sub_total: 80)
	 end

 	describe ".items_count" do 
 		it "render the number of items" do 
	 		sale_items_1 = create(:sale_item, sale_id: @sale.id, quantity: 2, variant_id: @small.id, price: 20)
	 		sale_items_2 = create(:sale_item, sale_id: @sale.id, quantity: 4, variant_id: @large.id, price: 20)

	 		expect(@current_basket.items_count).to eq(6)
 		end
 	end

 	describe ".add_item" do 
 		it 'add item to the cart' do 
 			@current_basket.add_item(quantity: 1, variant_id: @large.id )
	 		@current_basket.add_item(quantity: 2, variant_id: @small.id )

	 		expect(@current_basket.items_count).to eq(3)
	 	end
 	end

 	describe ".remove_item" do 
 		it 'remove item from the cart' do 
 			sale_items = create(:sale_item, sale_id: @sale.id, quantity: 2, variant_id: @small.id, price: 20)

 			@current_basket.remove_item(id:  sale_items.id)
	 		expect(@current_basket.sub_total).to eq 0
	 	end
 	end
end
