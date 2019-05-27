FactoryBot.define do
  factory :shipping_address do
  	user
    phone      { "0987654333" }
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    address_1  { Faker::Address.street_name }
    zipcode    { "43000"}
    city       { Faker::Address.city }
    country    { "FR"}
  end
end
