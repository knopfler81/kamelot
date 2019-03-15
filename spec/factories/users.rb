FactoryBot.define do
	factory :user do 
		first_name        { Faker::Name.first_name + 'n'}
		last_name         { Faker::Name.last_name }
		admin             { [false,true ].sample }
		sequence(:email)  { |n| "#{n}#{Faker::Internet.email}" }
		birth_date        {"20/10/1997"}
		password          { 'password'}
    confirmed_at      { Time.now }
	end	
end