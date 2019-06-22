require 'rails_helper'

RSpec.describe Stock, type: :model do
	it { should validate_presence_of(:supplier_id) }
	it { should validate_presence_of(:quantity) }
	it { should validate_presence_of(:cost_price) }
	it { should validate_presence_of(:market_price) }
	it { should validate_presence_of(:price) }

	describe "#define_supplier" do 

		before(:each) do 
	    @nike    = create(:supplier, company: "Nike")
			@product = create(:product, supplier_id: @nike.id)
			@variant = create(:variant, product_id: @product.id)
			@stock   = create(:stock, variant_id: @variant.id)
		end

		context "the supplier is the same" do 

			it "setup the same supplier" do 
				res = @stock.define_supplier

				expect(res).to eq "The Big Company" #nom par default factoruies
			end
		end

		context "the supplier is different" do 
			it "setup the new supplier" do 
				@stock = create(:stock, variant_id: @variant.id, supplier_id: @nike.id)
				res = @stock.define_supplier

				expect(res).to eq "Nike"
			end
		end
	end
end