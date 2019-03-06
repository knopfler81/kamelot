FactoryBot.define do
  factory :supplier do
    company {"The Big Company"}
    address { "Route de la soif"}
    zipcode {"42000"}
    city    { "Saint Etienne"}
    phone_number {"0909897865"}
    email {"company@example.com"}
  end
end
