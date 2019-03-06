FactoryBot.define do
  factory :stock do
    quantity { 1 }
    variant
    supplier
    cost_price { "" }
    price { "" }
  end
end
