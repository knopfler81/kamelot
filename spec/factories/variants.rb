FactoryBot.define do
  factory :variant do
    color { "Red" }
    size { "L" }
    cost_price { "" }
    price { "" }
    product
  end
end
