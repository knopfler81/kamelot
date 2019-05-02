FactoryBot.define do
  factory :order do
		user
		token 	{ "123456789" }
		status 	{ 1 }
		payment { "{ \'id\': 'ff42\',\'captured\': false}"} 
		charge_id {"ff42"}
		total_cents {[50, 120, 90].sample }
		sub_total  { [40, 115, 85].sample }
		total_weight { 2.3 }
		shipping_fees { 5 }
		gcos_accepted  { true }
		return_asked { false }
		return_limit_date { 5.days.ago }
  end
end