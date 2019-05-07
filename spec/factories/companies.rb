FactoryBot.define do
  factory :company do
    name        { "MyString" }
    address     { "MyString" }
    zipcode     { "MyString" }
    city        { "MyString" }
    country     { "MyString" }
    subject_vat { false }
    email       { 'knopfler42@gmail.com'}
  end
end
