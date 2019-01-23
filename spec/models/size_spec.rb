require 'rails_helper'

RSpec.describe Size, type: :model do
  it { should validate_presence_of(:size_name) }
  it { should validate_presence_of(:quantity) }

  fixtures :sizes

   	describe "#remove_from_stock" do 
   		it "removes a size from the stock" do 
   			s = sizes(:small_red_shirt)
   			s.remove_from_stock
   			expect(s.quantity).to eq(9)
   		end
   	end

   	describe "#re_add_in_stock" do 
   		it "re add a size in the stock" do 
   			s = sizes(:small_red_shirt)
   			s.re_add_in_stock
   			expect(s.quantity).to eq(11)
   		end
   	end
end
