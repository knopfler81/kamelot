FactoryBot.define do
  factory :restocking do
		price { 25 }
	  buying_price  { 5 }
	  product
	  after(:create) do |restocking|
	    create(:size, sizeable: restocking)
	  end
  end
end
