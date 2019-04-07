FactoryBot.define do
	factory :user do 
		first_name        						{ Faker::Name.first_name + 'n'}
		last_name         						{ Faker::Name.last_name }
		admin             						{ [false,true ].sample }
		sequence(:email)  						{ |n| "guest_#{n}@example.com" }
		sequence(:email_confirmation) { |n| "guest_#{n}@example.com" }
		birth_date        						{"20/10/1997"}
		password          						{ 'password'}
	end	
end