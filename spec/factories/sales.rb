FactoryBot.define do
  factory :sale do
    user
    token 	{ "123456789" }
    status 	{ [ 0, 1, 2].sample }
    total_cents {[50, 120, 90].sample} 
  end
end
