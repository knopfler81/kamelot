FactoryBot.define do
  factory :variant do
    color { "MyString" }
    size { "MyString" }
    buying_price { "MyString" }
    selling_price { "MyString" }
    product { nil }
  end
end
