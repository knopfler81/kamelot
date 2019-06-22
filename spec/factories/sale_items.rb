FactoryBot.define do
  factory :sale_item do
    sale
    variant
    quantity { 1 }
    market_price  { [12, 20, 45].sample }
  end
end
