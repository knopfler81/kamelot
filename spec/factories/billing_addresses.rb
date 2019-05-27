FactoryBot.define do
  factory :billing_address do
  	user  
  	phone      { Faker::PhoneNumber.phone_number }
  	first_name { Faker::Name.first_name }
  	last_name  { Faker::Name.last_name }
  	address_1  { Faker::Address.street_name }
  	zipcode    { Faker::Address.zip_code }
  	city       { Faker::Address.city }
  	country    { "FR"}
  end
end
