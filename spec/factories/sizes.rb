FactoryBot.define do
  factory :size do
    size_name {["S", "M", "L", "XL"].sample}
  	quantity {[2,3,4].sample}
  	product
  end
end