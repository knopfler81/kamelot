FactoryBot.define do
  factory :returning do
  	order
    number { "MyString" }
    limit_date { Date.today }
    status { 0 }
    reason { nil }
  end
end
