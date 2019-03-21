FactoryBot.define do
  factory :order do
		user
		token 	{ "123456789" }
		status 	{ [ :paid, :confirmed, :shipped, :cancelled, :refunded].sample }
		payment { {"stub" =>"stripe"}} 
		total_cents {[50, 120, 90].sample }
		sub_total  { [40, 115, 85].sample }
		total_weight { 2.3 }
		shipping_fees { 5 }
		gcos_accepted  { true }
  end
end