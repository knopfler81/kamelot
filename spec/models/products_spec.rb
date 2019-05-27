require 'rails_helper'

 RSpec.describe Product, type: :model do

 	it { should validate_presence_of(:title) }
 	it { should validate_presence_of(:price) }
 	it { should validate_presence_of(:buying_price) }
 	it { should validate_presence_of(:description) }
 	it { should validate_presence_of(:color) }
 	it { should validate_presence_of(:weight) }
 	it { should validate_presence_of(:brand) }
 	it { should validate_presence_of(:category_id) }


 	describe "#upcase_ref" do 
 		it "upcase the reference" do 
 			prod = create(:product, ref: "yolo")
 			
 			expect(prod.upcase_ref).to eq("YOLO")
 		end
 	end

 	describe "#with_stock?" do 
 		it "returns true" do 
	 		product = create(:product)
	 		var     = create(:variant, product_id: product.id)
 			create(:stock, variant_id: var.id, quantity: 2)
 			expect(product.with_stock?).to eq(true)
 		end

 		it "returns false" do 
	 		product = create(:product)
	 		var     = create(:variant, product_id: product.id)
 			expect(product.with_stock?).to eq(false)
 		end
 	end

 	describe "#set_discount" do 
 		it "returns the " do
 			product = create(:product, price: 100, discount_percentage: 20)

 			product.save!
 			expect(product.reload.discounted_price).to eq 80
 		end
 	end

end
