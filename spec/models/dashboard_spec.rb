require 'rails_helper'

RSpec.describe Dashboard, type: :model do
	let(:date_from) { 5.days.ago.to_date }
  let(:date_to)   { Date.tomorrow }


  subject { Dashboard.new(date_from: @date_from, date_to: @date_to) }

  before(:each) do 
  	Product.destroy_all
  	Category.destroy_all 
  	User.destroy_all 
  	Order.destroy_all
  end

	describe "#size_date_range" do
		it "returns the number of products created in this period" do 

			create(:product, sizes_attributes: [size_name: "L", quantity: 3, created_at: 3.months.ago])
			create(:product, sizes_attributes: [size_name: "L", quantity: 3, created_at: 1.day.ago])
			create(:product, sizes_attributes: [size_name: "L", quantity: 3, created_at: 1.day.ago])

			res = subject.size_date_range.count 
			expect(res).to eq(2)
		end
	end

	describe "#products_counts" do 
		it "returns the total number of product" do
			create(:product, sizes_attributes: [size_name: "L", quantity: 3, created_at: 3.months.ago])
			create(:product, sizes_attributes: [size_name: "L", quantity: 3, created_at: 1.day.ago])
			create(:product, sizes_attributes: [size_name: "L", quantity: 3, created_at: 1.day.ago])
			
			res = subject.products_counts
			expect(res).to eq(3)
		end
	end

	describe "#products_added_by_week" do 
		it "returns the total number of product" do
			create(:product, created_at: 2.weeks.ago ,sizes_attributes: [size_name: "L", quantity: 3, created_at: 2.weeks.ago])
			create(:product, created_at: 2.day.ago ,sizes_attributes: [size_name: "L", quantity: 3, created_at: 2.day.ago])
			create(:product, created_at: Date.today + 1 ,sizes_attributes: [size_name: "L", quantity: 3, created_at: 1.day.ago])
			
			res = subject.products_added_by_week

			expect(res.values.last).to eq(1)
		end
	end

	describe "#products_added_by_month" do 
		it "returns the total number of product" do
			create(:product, created_at: 2.day.ago ,sizes_attributes: [size_name: "L", quantity: 3, created_at: 2.day.ago])
			create(:product, created_at: 1.day.ago ,sizes_attributes: [size_name: "L", quantity: 3, created_at: 1.day.ago])
			
			res = subject.products_added_by_month

			expect(res.values.last).to eq(2)
		end
	end

	describe "#products_per_category" do 

		it "return the number of product per category" do 
			pull   = create(:category, title: "Pull")
			tshirt = create(:category, title: "Tshirt")
			create(:product, category_id: pull.id, sizes_attributes: [size_name: "L", quantity: 3])
			create(:product, category_id: pull.id, sizes_attributes: [size_name: "L", quantity: 3])
			create(:product, category_id: tshirt.id, sizes_attributes: [size_name: "L", quantity: 3])

			res = subject.products_per_category

			expect(res).to eq({"Pull"=>2, "Tshirt"=>1})

		end
	end

	describe "#sizes_per_products" do 
		it "returns the quantity in each size" do 
			create(:product, sizes_attributes: [{size_name: "L", quantity: 2}, {size_name: "S", quantity: 3}])
			create(:product, sizes_attributes: [{size_name: "L", quantity: 3}, {size_name: "S", quantity: 3}])
			res = subject.sizes_per_products

			expect(res).to eq({"L"=>5, "S"=>6})
		end
	end 

	describe "#clients_counts" do 
		it "returns the total number of users" do
			create(:user)
			create(:user)
			create(:user)
			
			res = subject.clients_counts
			expect(res).to eq(3)
		end
	end

	describe "#clients_registration_by_week" do 
		it "returns the total number of user by week" do
			#create(:user, created_at: 2.weeks.ago)
			create(:user, created_at: Date.today + 1 )
			#create(:user, created_at: 1.day.ago)
			
			res = subject.clients_registration_by_week

			expect(res.values.last).to eq(1)
		end
	end

	describe "#clients_registration_by_month" do 
		it "returns the total number of user by month" do
			create(:user, created_at: 2.day.ago)
			create(:user, created_at: 1.day.ago)
			
			res = subject.clients_registration_by_month

			expect(res.values.last).to eq(2)
		end
	end

	#ORDER###################### 
	describe "#orders_counts" do 
		it "returns the total number of orders" do
			create(:order)
			create(:order)
			create(:order)
			
			res = subject.orders_counts
			expect(res).to eq(3)
		end
	end

	describe "#orders_by_week" do 
		it "returns the  number of order by week" do
			create(:order, created_at: 2.weeks.ago)
			create(:order, created_at: Date.today + 1 )
			create(:order, created_at: Date.today + 1)
			
			res = subject.orders_by_week

			expect(res.values.last).to eq(2)
		end
	end

	describe "#orders_by_month" do 
		it "returns the number of order by month" do
			create(:order, created_at: 2.day.ago)
			create(:order, created_at: 1.day.ago)
			
			res = subject.orders_by_month

			expect(res.values.last).to eq(2)
		end
	end

	describe "#refunded_orders_count" do 
		it "returns the number of refunded order" do
			create(:order, status: 1)
			create(:order, status: 4)
			
			res = subject.refunded_orders_count

			expect(res).to eq(1)
		end
	end

	describe "#orders_status" do 
		it "returns the number of user" do
			create(:order, status: 1)
			create(:order, status: 1)
			create(:order, status: 4)
			
			res = subject.orders_status

			expect(res).to eq({"cancelled"=>1, "paid"=>2})
		end
	end

	describe "#orders_turnover_per_month" do 
		it "returns the turn over by month" do 
			create(:order, sub_total: 100, created_at: 2.month.ago)
			create(:order, sub_total: 200, created_at: 2.month.ago)
			create(:order, sub_total: 300, created_at: 2.month.ago)
			create(:order, sub_total: 50, created_at: 1.day.ago)
			create(:order, sub_total: 20, created_at: 1.day.ago)
			create(:order, sub_total: 300, created_at: 1.day.ago)

			res = subject.orders_turnover_per_month

			expect(res.values.last).to eq(370)
		end
	end

	# describe "#number_of_sales" do 
	# 	it "renders the number of sales in a given size", :skip => "A revoir il y a un truc qui cloche" do 
	# 		@prod = create(:product, sizes_attributes: [size_name: "S", quantity: 4])
	# 		@size = create(:size, product_id: @prod.id, size_name: "S", quantity: 4)

	# 		puts @prod.sizes[0].id.inspect
	# 		@order = create(:order)

	# 		@order_item = create(:order_item, order_id: @order.id, size_id:  @prod.sizes[0].id, quantity: 2)

	# 		#a reprendre qq chose est faux
	# 		# res =  subject.number_of_sales(@order_item.size)
	# 		# expect(res).to eq(2)

	# 	end
	# end
	#ORDER###################### 
	describe "#sales_counts" do 
		it "returns the total number of orders" do
			create(:sale)
			create(:sale)
			create(:sale)
			
			res = subject.sales_counts
			expect(res).to eq(3)
		end
	end

	describe "#sales_by_week" do 
		it "returns the  number of sale by week" do
			create(:sale, created_at: 2.weeks.ago)
			create(:sale, created_at: Date.today + 1 )
			create(:sale, created_at: Date.today + 1)
			
			res = subject.sales_by_week

			expect(res.values.last).to eq(2)
		end
	end

	describe "#sales_by_month" do 
		it "returns the number of sale by month" do
			create(:sale, created_at: 2.day.ago)
			create(:sale, created_at: 1.day.ago)
			
			res = subject.sales_by_month

			expect(res.values.last).to eq(2)
		end
	end
end
