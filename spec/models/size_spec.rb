require 'rails_helper'

RSpec.describe Size, type: :model do
  it { should validate_presence_of(:size_name) }
  it { should validate_presence_of(:quantity) }

    before(:each) do 
      @product = create(:product, sizes_attributes: [size_name: "S", quantity: 10])

    end
   	describe "#remove_from_stock" do 
   		it "removes a size from the stock" do 
   			s = @product.sizes[0]
   			s.remove_from_stock
   			expect(s.quantity).to eq(9)
   		end
   	end

   	describe "#re_add_in_stock" do 
   		it "re add a size in the stock" do 
        s = @product.sizes[0]
   			s.re_add_in_stock
   			expect(s.quantity).to eq(11)
   		end
   	end
end
