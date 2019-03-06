require 'rails_helper'

RSpec.describe Dashboard, type: :model do
	 let(:date_from) { 5.days.ago.to_date }
   let(:date_to)   { Date.today }


  subject { Dashboard.new(date_from: @date_from, date_to: @date_to) }

  before(:each) do 
  	Product.destroy_all
  	Size.destroy_all
  	Category.destroy_all 
  	User.destroy_all 
  	Order.destroy_all
  end

	describe "#variant_date_range" do
		it "returns the number of products created in this period" do 
			create(:product, brand: "machin", created_at: 1.month.ago)
			bidule = create(:product, brand: "bidule", created_at: 1.day.ago)
			create(:variant, product_id: bidule.id, created_at: 1.day.ago )
			res = subject.variant_date_range.count 

			expect(res).to eq(1)
		end
	end

	describe "#products_counts" do 
		it "returns the total number of product" do
			create(:product, variants_attributes: [size: "L", created_at: 3.months.ago])
			create(:product, variants_attributes: [size: "L", created_at: 1.day.ago])
			create(:product, variants_attributes: [size: "L", created_at: 1.day.ago])
			
			res = subject.products_counts
			expect(res).to eq(3)
		end
	end

	describe "#products_added_by_week" do 
		it "returns the total number of product" do
			create(:product, created_at: 2.weeks.ago, variants_attributes: [size: "L"])
			create(:product, created_at: Date.today , variants_attributes: [size: "L"])
			
			res = subject.products_added_by_week

			expect(res.values.last).to eq(1)
		end
	end

	describe "#products_added_by_month" do 
		it "returns the total number of product" do
			create(:product, created_at: 2.day.ago ,variants_attributes: [size: "L"])
			create(:product, created_at: 1.day.ago ,variants_attributes: [size: "L", created_at: 1.day.ago])
			
			res = subject.products_added_by_month

			expect(res.values.last).to eq(2)
		end
	end

	describe "#products_per_category" do 

		it "return the number of product per category" do 
			pull   = create(:category, title: "Pull")
			tshirt = create(:category, title: "Tshirt")
			create(:product, category_id: pull.id, variants_attributes: [size: "L"])
			create(:product, category_id: pull.id, variants_attributes: [size: "L"])
			create(:product, category_id: tshirt.id, variants_attributes: [size: "L"])

			res = subject.products_per_category

			expect(res).to eq({"Pull"=>2, "Tshirt"=>1})

		end
	end

	describe "#variants_per_products" do 
		it "returns the number of variants" do 
			pd  = create(:product)
			create(:variant, size: "S", product_id: pd.id)
			create(:variant, size: "S", color: "Rouge", product_id: pd.id)

			res = subject.variants_per_products
			
			expect(res.values.last).to eq(2)
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
			#create(:user, created_at: 2.days.ago)
			create(:user, created_at: Date.today )
			
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
			create(:order, created_at: Date.today)
			create(:order, created_at: Date.today)
			
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
			create(:order, sub_total: 100, created_at: 1.month.ago)
			create(:order, sub_total: 200, created_at: 1.month.ago)
			create(:order, sub_total: 300, created_at: 1.month.ago)
			create(:order, sub_total: 50,  created_at: 1.day.ago)
			create(:order, sub_total: 20,  created_at: 1.day.ago)
			create(:order, sub_total: 300, created_at: 1.day.ago)

			res = subject.orders_turnover_per_month

			expect(res.values.last.to_i).to eq(370)
		end
	end

	# describe "#number_of_sales" do 
	# 	it "renders the number of sales in a given size" => "A revoir il y a un truc qui cloche" do 
	# 		@prod = create(:product, variants_attributes: [size: "S", quantity: 4])
	# 		@size = create(:size, product_id: @prod.id, size: "S", quantity: 4)

	# 		puts @prod.variants[0].id.inspect
	# 		@order = create(:order)

	# 		@order_item = create(:order_item, order_id: @order.id, size_id:  @prod.variants[0].id, quantity: 2)

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
			create(:sale, created_at: 1.day.ago)
			create(:sale, created_at: Date.today )
			
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
