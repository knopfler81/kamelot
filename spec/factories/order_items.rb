FactoryBot.define do
  factory :order_item do
  	order
  	size
  	product
  	user
  	quantity { [1,2,3].sample }
  	price    { [12, 20, 45].sample }
  end
end
