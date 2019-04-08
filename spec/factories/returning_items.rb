FactoryBot.define do
  factory :returning_item do
  	returning
  	order_item
  	selected { true }
  end
end
