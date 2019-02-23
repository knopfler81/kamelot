require 'rails_helper'

RSpec.describe Restocking, type: :model do
	it { should validate_presence_of(:price) }
	it { should validate_presence_of(:buying_price) }

	describe "#update_existing_product" do
		it "update existing product sizes' and prices" do 
			user   = create(:user, admin: true)
			product = create(:product, price: 20, user_id: user.id, buying_price: 10, sizes_attributes: [{size_name: "S", quantity: 3}])
			restocking = create(:restocking, product_id: product.id, price: 30, buying_price: 9, sizes_attributes: [{size_name: "S", quantity: 10},{size_name: "L", quantity: 10}])
			restocking = restocking.update_existing_product

			expect(Product.where(id: product.id).last.price).to eq(30)
			expect(Product.where(id: product.id).last.buying_price).to eq(9)
			expect(Size.where(sizeable_id: product.id).last.size_name).to eq("L")
			expect(Size.where(sizeable_id: product.id).last.quantity).to eq(10)
		end
	end
end
