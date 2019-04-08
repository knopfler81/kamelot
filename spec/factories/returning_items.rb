FactoryBot.define do
  factory :returning_item do
  	returning
  	variant
  	order_item
  	quantity { 2 }
  	selected { true }
  	price { 20 }
  end
end
