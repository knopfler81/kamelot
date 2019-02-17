require 'rails_helper'

 RSpec.describe SaleItem, type: :model do
 	fixtures :products, :users, :sizes
 	
 	before(:each) do 
 		@shirt  = products(:blue_shirt)
 		@small  = sizes(:small_blue_shirt)
 		@large  = sizes(:large_blue_shirt)
 		@nelly  = users(:nelly)
 		@token  = 12345678
	 	@current_basket ||= VendingBasket.new(token: @token)
	 	@sale  = Sale.create(user_id: @nelly.id, token: @token, status: "pending", sub_total: 80)
	 end

 	describe ".items_count" do 
 		it "render the number of items" do 
	 		sale_items_1 = SaleItem.create(sale_id: @sale.id, quantity: 2, size_id: @small.id, price: 20)
	 		sale_items_2 = SaleItem.create(sale_id: @sale.id, quantity: 4, size_id: @large.id, price: 20)

	 		expect(@current_basket.items_count).to eq(6)
 		end
 	end


 	describe ".add_item" do 
 		it 'add item to the cart' do 
 			@current_basket.add_item(quantity: 1, size_id: @large.id, )
	 		@current_basket.add_item(quantity: 2, size_id: @small.id, )

	 		expect(@current_basket.items_count).to eq(3)
	 	end
 	end

 	describe ".remove_item" do 
 		it 'remove item from the cart' do 
 			sale_items = SaleItem.create(sale_id: @sale.id, quantity: 2, size_id: @small.id, price: 20)

 			@current_basket.remove_item(id:  sale_items.id)
	 		expect(@current_basket.sub_total).to eq 0
	 	end
 	end
end
