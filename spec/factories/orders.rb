FactoryBot.define do
  factory :order do
		user
		token 	{ "123456789" }
		status 	{ [ 0, 1, 2, 3, 4 ,5].sample }
		payment { {"stub" =>"stripe"}} 
		total_cents {[50, 120, 90].sample }
		sub_total  { [40, 115, 85].sample }
		total_weight { 2.3 }
		shipping_fees { 5 }
		gcos_accepted  { true }
		return_asked { false }
		return_limit_date { 5.days.ago }
  end
end