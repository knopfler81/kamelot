FactoryBot.define do
  factory :stock do
    quantity { 1 }
    variant
    supplier
    cost_price { 5 }
    price { 100 }
    market_price { 90 }
    discount { 0 }
  end
end
