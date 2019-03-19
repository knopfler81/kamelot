FactoryBot.define do
  factory :main_category do
  	gender { ["Homme", "Femme", "Unisexe"].sample }
  end
end
