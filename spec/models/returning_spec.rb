require 'rails_helper'


 RSpec.describe Returning, type: :model do

 		describe "#re_add_to_stock" do 

 			it "re add the returned item to stock" do
 				john    = create(:user)
 				order   = create(:order, user_id: john.id, return_asked: true)
 				@return = create(:returning, user_id: john.id, status: "refunded", order_id: order.id)
 				item    = create(:returning_item, returning_id: @return.id, price: 20, selected: true)
 				stocks  = [create(:stock, variant_id: item.variant_id, quantity: 1), create(:stock, variant_id: item.variant_id, quantity: 2)]
 				@return.re_add_to_stock

 				expect(stocks.last.quantity).to eq  2
 			end
 		end


 	 	describe "#set_order_status" do 
 	 		it "chages the status order" do 
 	 			john   = create(:user)
 	 			order  = create(:order, user_id: john.id, return_asked: true)
 	 			@return = create(:returning, user_id: john.id, status: "refunded", order_id: order.id)
 	 			
 	 			@return.set_order_status

 	 			expect(@return.order.status).to eq "totally_refunded"
 	 		end
 	 	end

 	 	describe "#total_refund" do 
 	 		it "renders the total amout of returned item" do 
 	 			john       = create(:user)
 	 			order      = create(:order, user_id: john.id, return_asked: true)
 	 			ord_item_1 = create(:order_item, order_id: order.id, quantity: 1)
 	 			ord_item_2 = create(:order_item, order_id: order.id, quantity: 2)
 	 			ret        = create(:returning, user_id: john.id, status: "pending")
 	 			ret_item_1 = create(:returning_item, order_item_id: ord_item_1.id, returning_id: ret.id, price: 20, selected: true, quantity: 1)
 	 			ret_item_2 = create(:returning_item, order_item_id: ord_item_2.id, returning_id: ret.id, price: 50, selected: true, quantity: 2)

 	 			expect(ret.total_refund).to eq 120
 	 		end
 	 	end


 end