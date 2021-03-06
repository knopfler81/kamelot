require 'rails_helper'

RSpec.describe Dashboard, type: :model do
	 let(:date_from) { 6.days.ago.to_date }
   let(:date_to)   { 1.day.ago}


  subject { Dashboard.new(date_from: @date_from, date_to: @date_to) }

  before(:each) do 
  	Stock.destroy_all
  	Variant.destroy_all
  	Product.destroy_all
  	MainCategory.destroy_all
  	Category.destroy_all 
  	Order.destroy_all
  	Sale.destroy_all
  	User.destroy_all
    Timecop.freeze(Time.now.beginning_of_month + 24.days)
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
			create(:product, created_at: 1.day.ago, variants_attributes: [size: "L"])
			
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
			main   = create(:main_category, gender: 'Homme') 
			pull   = create(:category, title: "Pull", main_category_id: main.id)
			tshirt = create(:category, title: "Tshirt", main_category_id: main.id)
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
			create(:user, created_at: 1.day.ago)
			
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
			create(:order, created_at: 1.days.ago)
			create(:order, created_at: 1.days.ago)
			
			res = subject.orders_by_week

			expect(res.values.last).to eq(2)
		end
	end

	describe "#orders_by_month" do 
		it "returns the number of order by month" do
			create(:order, created_at: 2.days.ago)
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
		it "returns the number of order" do
			create(:order, status: "pending")
			create(:order, status: "pending")
			create(:order, status: "partly_shipped")
			
			res = subject.orders_status

			expect(res).to eq({"partly_shipped"=>1, "pending"=>2})
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

	describe "#order_item_category" do 
		it "returns the number of orders per category" do
			polo_cat  = create(:category, title: "Polos")
			shirt_cat = create(:category, title: "Shirt")
			polo      = create(:product, title: "Polos", category_id: polo_cat.id)
			shirt     = create(:product, title: "Shirt", category_id: shirt_cat.id)
			var_1     = create(:variant, product_id: polo.id)
			var_2     = create(:variant, product_id: shirt.id)

			create(:order_item, quantity: 5, variant_id: var_1.id)
			create(:order_item, quantity: 1, variant_id: var_2.id)
			
			res = subject.order_item_category

			expect(res).to eq({"Polos"=>5, "Shirt"=>1})

		end
	end

	#SALES ###################### 
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
		it "returns the  number of sales by week" do
			create(:sale, created_at: 2.weeks.ago)
			create(:sale, created_at: 1.days.ago)
			create(:sale, created_at: 1.day.ago)
			
			res = subject.sales_by_week
		
			expect(res.values.last).to eq(2)
		end
	end

	describe "#sales_by_month" do 
		it "returns the number of sale by month" do
			create(:sale, created_at: 2.days.ago)
			create(:sale, created_at: 1.day.ago)
			
			res = subject.sales_by_month

			expect(res.values.last).to eq(2)
		end
	end

	describe "#sale_item_category" do 
		it "returns the number of sales per category" do
			polo_cat  = create(:category, title: "Polos")
			shirt_cat = create(:category, title: "Shirt")
			polo      = create(:product, title: "Polos", category_id: polo_cat.id)
			shirt     = create(:product, title: "Shirt", category_id: shirt_cat.id)
			var_1     = create(:variant, product_id: polo.id)
			var_2     = create(:variant, product_id: shirt.id)

			create(:sale_item, quantity: 5, variant_id: var_1.id)
			create(:sale_item, quantity: 1, variant_id: var_2.id)
			
			res = subject.sale_item_category

			expect(res).to eq({"Polos"=>5, "Shirt"=>1})

		end
	end


	#RETURNINGS##################

	describe "#returnings_counts" do 
		it "returns the  total number of returnings" do
			create(:returning, created_at: 2.weeks.ago)
			create(:returning, created_at: 2.days.ago)
			create(:returning, created_at: 1.day.ago)
			
			res = subject.returnings_counts
		
			expect(res).to eq(3)
		end
	end

	describe "#returnings_by_week" do 
		it "returns the  number of returnings by week" do
			create(:returning, created_at: 1.days.ago)
			create(:returning, created_at: 1.day.ago)
			
			res = subject.returnings_by_week
		
			expect(res.values.last).to eq(2)
		end
	end

	describe "#returnings_by_month" do 
		it "returns the number of returnings by month" do
			create(:returning, created_at: 2.days.ago)
			create(:returning, created_at: 1.day.ago)
			
			res = subject.returnings_by_month

			expect(res.values.last).to eq(2)
		end
	end

	describe "#returning_status" do 
		it "returns the number of returning" do
			create(:returning, status: "pending")
			create(:returning, status: "confirmed")
			create(:returning, status: "refunded")
			create(:returning, status: "refunded")
			
			res = subject.returnings_status

			expect(res).to eq({"pending"=>1, "confirmed"=>1, "refunded" =>2})
		end
	end

	describe "#returning_item_category" do 
		it "returns the number of returings per category" do
			polo_cat  = create(:category, title: "Polos")
			shirt_cat = create(:category, title: "Shirt")
			polo      = create(:product, title: "Polos", category_id: polo_cat.id)
			shirt     = create(:product, title: "Shirt", category_id: shirt_cat.id)
			var_1     = create(:variant, product_id: polo.id)
			var_2     = create(:variant, product_id: shirt.id)

			create(:returning_item, quantity: 5, variant_id: var_1.id)
			create(:returning_item, quantity: 1, variant_id: var_2.id)
			
			res = subject.returning_item_category

			expect(res).to eq({"Polos"=>5, "Shirt"=>1})

		end
	end
end
