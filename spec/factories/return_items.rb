FactoryBot.define do
  factory :returning_item do
  	returning
    reason { "MyText" }
    state { "MyString" }
  end
end
