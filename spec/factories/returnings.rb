FactoryBot.define do
  factory :returning do
  	order
  	user
    number { "MyString" }
    limit_date { Date.today }
    status { 0 }
    reason { nil }
  end
end
