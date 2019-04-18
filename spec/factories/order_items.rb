FactoryBot.define do
  factory :order_item do
  	order
  	variant
  	weight { 0.3 }
  	quantity { 1 }
  	price    { [12, 20, 45].sample }
  	missing_quantity { 0 }
  end
end
