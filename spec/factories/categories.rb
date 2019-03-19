FactoryBot.define do
	n = 0
  factory :category do
  	title { ["Pull", "Pantalon", "Tshirt", "Polo", "Chemise"].sample + (n+=1).to_s }
  	main_category
  end
end
