FactoryBot.define do
  factory :billing_address do
  	order
  	user  
  	phone         { Faker::PhoneNumber.phone_number }
  	first_name    { Faker::Name.first_name }
  	last_name     { Faker::Name.last_name }
  	street_number { rand(1..400) }
  	route         { Faker::Address.street_name }
  	postal_code   { Faker::Address.zip_code }
  	locality      { Faker::Address.city }
  end
end
