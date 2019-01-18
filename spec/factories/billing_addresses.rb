FactoryBot.define do
  factory :billing_address do
    address_1 { "MyString" }
    address_2 { "MyString" }
    zipcode { "MyString" }
    city { "MyString" }
    phone { "MyString" }
    references { "" }
  end
end
