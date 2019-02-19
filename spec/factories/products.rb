FactoryBot.define do
  factory :product do
  	title { Faker::Artist.name  +  " " + Faker::Color.color_name}
  	ref   { Faker::Number.number(10)}
  	price { Faker::Number.number(2) }
    buying_price  { 5 }
  	color { Faker::Color.color_name }
  	brand { Faker::TvShows::BreakingBad }
  	description { Faker::Lorem.sentence(3) }
    attachments { [
      File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_1.jpg")),
      File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_2.jpg")),
      File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_3.jpg")),
      File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_4.jpg"))
    ] }
    user { User.first || association(:user, admin: true)}
    category 
  end
end