ActionMailer::Base.perform_deliveries = false

Category.destroy_all
Order.destroy_all
Sale.destroy_all
Product.destroy_all
BillingAddress.destroy_all
ShippingAddress.destroy_all
User.destroy_all
Supplier.destroy_all
MainCategory.destroy_all
Returning.destroy_all
Company.destroy_all


#COMPANY 
c = Company.instance
c.update_attributes!(admin_name: "Nelly Duclos", address_1: '11/11', zipcode: "42450", city: "SURY", country:"France", email: "admin@example.com", site_name: "La Penderie De L'Homme", phone: "099999999", siret: "8888888")
c.save

#SUPPLIER

supplier_1 =  Supplier.create!(
	company: "Fernand",
	address: "Chemin du Puits",
	zipcode: "42290",
	city: "Sorbiers",
	phone_number: "0909876756",
	email: "suplier_1@example.com"
	)

supplier_2 =   Supplier.create!(
	company: "Morin",
	address: "Route des blés",
	zipcode: "42450",
	city: "Sury Le Comtal",
	phone_number: "09339876756",
	email: "suplier_2@example.com"
	)

stil_park = Supplier.create!(
	company: "Stil Park",
	address: "90 Rue de la Haie Coq",
	zipcode: "93300",
	city: "Aubervilliers",
	phone_number: "01 48 33 28 16",
	email: "stilpark@example.com"
	)

enzo = Supplier.create!(
	company: "Enzo Di Capri",
	address: "70 Rue de la Haie Coq",
	zipcode: "93300",
	city: "Aubervilliers",
	phone_number: "01 48 34 36 04",
	email: "enzo@example.com"
	)


enzo = Supplier.create!(
	company: "Divers",
	address: "Divers",
	zipcode: "Divers",
	city: "Divers",
	phone_number: "Divers",
	email: "Divers"
	)

nelly = User.new.tap do |u|
  u.list_subscriber = true
	u.admin =  true
	u.email = "nelly@example.com"
	u.email_confirmation = "nelly@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = "Nelly"
	u.last_name = "Duclos"
	u.save!
end

user_1 = User.new.tap do |u|
	u.list_subscriber = true

	u.admin =  false
	u.email = "guest1@example.com"
	u.email_confirmation = "guest1@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end

user_2 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest2@example.com"
	u.email_confirmation = "guest2@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end

user_3 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest3@example.com"
	u.email_confirmation = "guest3@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end

user_4 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest4@example.com"
	u.email_confirmation = "guest4@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end

user_5 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest5@example.com"
	u.email_confirmation = "guest5@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end

user_6 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest6@example.com"
	u.email_confirmation = "guest6@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end


user_7 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest7@example.com"
	u.email_confirmation = "guest7@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end


user_8 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest8@example.com"
	u.email_confirmation = "guest8@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end


user_9 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest9@example.com"
	u.email_confirmation = "guest9@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end


user_10 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest10@example.com"
	u.email_confirmation = "guest10@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end


user_11 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest11@example.com"
	u.email_confirmation = "guest11@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end

user_12 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest12@example.com"
	u.email_confirmation = "guest12@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end


user_13 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest13@example.com"
	u.email_confirmation = "guest13@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end


user_14 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest14@example.com"
	u.email_confirmation = "guest14@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end


user_15 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest15@example.com"
	u.email_confirmation = "guest15@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end

user_16 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest16@example.com"
	u.email_confirmation = "guest16@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end

user_17 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest17@example.com"
	u.email_confirmation = "guest17@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end

user_18 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest18@example.com"
	u.email_confirmation = "guest18@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end


user_19 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest19@example.com"
	u.email_confirmation = "guest19@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end


user_20 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest20@example.com"
	u.email_confirmation = "guest20@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end


user_21 = User.new.tap do |u|
	u.list_subscriber = true
	u.admin =  false
	u.email = "guest21@example.com"
	u.email_confirmation = "guest21@example.com"
	u.password =  "password"
	u.password_confirmation =  "password"
	u.gender = [true, false].sample
	u.birth_date = "12/02/1980"
	u.first_name = Faker::Name.first_name
	u.last_name = Faker::Name.last_name
	u.save!
end


puts "Users & admin created"

men =  MainCategory.create!(gender: "Homme")
# women = MainCategory.create!(gender: "Femme")

pulls 			= Category.create!(title: "Pulls",       main_category_id: men.id)
pantalons 	= Category.create!(title: "Pantalons",   main_category_id: men.id)
tshirt 			= Category.create!(title: "Tshirt",     main_category_id: men.id)
accessoires = Category.create!(title: "Accessoires", main_category_id: men.id)
chemise 		= Category.create!(title: "Chemises",    main_category_id: men.id)
polos       = Category.create!(title: "Polos",       main_category_id: men.id)
bermudas 	= Category.create!(title: "Bermudas",   main_category_id: men.id)

 puts "Categories created"


product_1 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "SP00",
	brand: "Stil Park",
	category_id: pulls.id,
	created_at: 10.weeks.ago,
	user_id: nelly.id,
	buying_price: 10,
	price: 30,
	market_price: 25,
	color: "Noir",
	title: "Pull",
	description: "Pull Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/pull_noir_1.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_noir_2.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_noir_3.jpg")),
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 1.weeks.ago
			},
			{
			size: "M",
			created_at: 1.weeks.ago
			},
			{
			size: "L",
			created_at: 1.weeks.ago
			},
			{
			size: "XL",
			created_at: 1.weeks.ago
			}
		]
)



product_2 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "GU00",
	brand: "Guess",
	category_id: pulls.id,
	created_at: 10.weeks.ago,
	user_id: nelly.id,
	buying_price: 12,
	price: 40,
	market_price: 25,
	color: "Blanc",
	title: "Pull",
	description: "Pull Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/pull_blanc_1.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_blanc_2.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_blanc_3.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_blanc_4.jpg"))
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 3.weeks.ago
			},
			{
			size: "M",
			created_at: 3.weeks.ago
			},
			{
			size: "L",
			created_at: 3.weeks.ago
			},
			{
			size: "XL",
			created_at: 3.weeks.ago
			}
		]
)


product_3 = Product.create!(
	weight: 0.2,
	discount_percentage: 10,
	discounted_price: 36,
	ref:"SP00" ,
	brand: "Stil Park",
	category_id: pulls.id,
	created_at: 10.weeks.ago,
	user_id: nelly.id,
	buying_price: 15,
	price: 40,
	market_price: 25,
	color: "Rouge",
	title: "Pull",
	description: "Pull Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/pull_rouge_1.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_rouge_2.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_rouge_3.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_rouge_4.jpg"))
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 3.weeks.ago
			},
			{
			size: "M",
			created_at: 3.weeks.ago
			},
			{
			size: "L",
			created_at: 3.weeks.ago
			},
			{
			size: "XL",
			created_at: 3.weeks.ago
		}
	
		]
)


product_4 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "LE00",
	brand: "Levis",
	category_id: pantalons.id,
	created_at: 10.weeks.ago,
	user_id: nelly.id,
	buying_price: 20,
	price: 49,
	market_price: 25,
	color: "Jaune",
	title: "Pantalon",
	description: "Pantalon Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/pantalon_jaune_1.jpg")),
		File.open(File.join("app/assets/images/seeds/pantalon_jaune_2.jpg")),
		File.open(File.join("app/assets/images/seeds/pantalon_jaune_3.jpg")),
		File.open(File.join("app/assets/images/seeds/pantalon_jaune_4.jpg"))
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 5.weeks.ago
			},
			{
			size: "M",
			created_at: 5.weeks.ago
			},
			{
			size: "L",
			created_at: 5.weeks.ago
			},
			{
			size: "XL",
			created_at: 5.weeks.ago
			}
		]
)


product_5 = Product.create!(
	weight: 0.2,
	discount_percentage: 50,
	discounted_price: 30,
	ref: "LE00" ,
	brand: "Levis",
	category_id: pantalons.id,
	created_at: 6.weeks.ago,
	user_id: nelly.id,
	buying_price: 12,
	price: 60,
	market_price: 25,
	color: "Gris",
	title: "Jean",
	description: "Pantalon Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/jean_gris_1.jpg")),
		File.open(File.join("app/assets/images/seeds/jean_gris_2.jpg")),
		File.open(File.join("app/assets/images/seeds/jean_gris_3.jpg")),
		File.open(File.join("app/assets/images/seeds/jean_gris_4.jpg"))
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 5.weeks.ago
			},
			{
			size: "M",
			created_at: 5.weeks.ago
			},
			{
			size: "L",
			created_at: 5.weeks.ago
			},
			{
			size: "XL",
			created_at: 5.weeks.ago
			}
		]
)


product_6 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KA0",
	brand: "Kaporal",
	category_id: pantalons.id,
	created_at: 5.weeks.ago,
	user_id: nelly.id,
	buying_price: 5,
	price: 20,
	market_price: 25,
	color: "Bleu",
	title: "Jean",
	description: "Pantalon Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/jean_bleu_1.jpg")),
		File.open(File.join("app/assets/images/seeds/jean_bleu_2.jpg")),
		File.open(File.join("app/assets/images/seeds/jean_bleu_3.jpg")),
		File.open(File.join("app/assets/images/seeds/jean_bleu_4.jpg"))
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 5.weeks.ago
			},
			{
			size: "M",
			created_at: 5.weeks.ago
			},
			{
			size: "L",
			created_at: 5.weeks.ago
			},
			{
			size: "XL",
			created_at: 5.weeks.ago
			}
		]
)

product_7 = Product.create!(
	discount_percentage: 10,
	discounted_price: 45,
	weight: 0.2,
	ref: "SP00",
	brand: "Stil Park",
	category_id: pulls.id,
	created_at: 6.weeks.ago,
	user_id: nelly.id,
	buying_price: 17,
	price: 50,
	market_price: 25,
	color: "Noir",
	title: "Pull",
	description: "Pull Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_2.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/pull_noir_2.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_noir_1.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_noir_3.jpg")),
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 6.weeks.ago
			},
			{
			size: "M",
			created_at: 6.weeks.ago
			},
			{
			size: "L",
			created_at: 6.weeks.ago
			},
			{
			size: "XL",
			created_at: 6.weeks.ago
			}
		]
)

product_8 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "GU00",
	brand: "Guess",
	category_id: pulls.id,
	created_at: 6.weeks.ago,
	user_id: nelly.id,
	buying_price: 12,
	price: 30,
	market_price: 25,
	color: "Vert",
	title: "Pull",
	description: "Pull Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_2.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/pull_vert_2.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_vert_1.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_vert_3.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_vert_4.jpg"))
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 6.weeks.ago
			},
			{
			size: "M",
			created_at: 6.weeks.ago
			},
			{
			size: "L",
			created_at: 6.weeks.ago
			},
			{
			size: "XL",
			created_at: 6.weeks.ago
			}
		]
)

product_9 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "GU00",
	brand: "Guess",
	category_id: pulls.id,
	created_at: 5.weeks.ago,
	user_id: nelly.id,
	buying_price: 25,
	price: 70,
	market_price: 25,
	color: "Beige",
	title: "Pull",
	description: "Pull Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/pull_beige_1.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_beige_2.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_beige_3.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_beige_4.jpg"))
	],
	variants_attributes: [
			{
			size: "M",
			created_at: 7.weeks.ago
			},
			{
			size: "L",
			created_at: 7.weeks.ago
			},
			{
			size: "XL",
			created_at: 7.weeks.ago
			}
		]	
)

product_10 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "GU00",
	brand: "Guess",
	category_id: pulls.id,
	created_at: 5.weeks.ago,
	user_id: nelly.id,
	buying_price: 25,
	price: 70,
	market_price: 25,
	color: "Camel",
	title: "Pull",
	description: "Pull Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_2.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/pull_camel_1.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_camel_2.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_camel_3.jpg")),
		File.open(File.join("app/assets/images/seeds/pull_camel_4.jpg"))
	],
	variants_attributes: [
			{
			size: "M",
			created_at: 7.weeks.ago
			},
			{
			size: "L",
			created_at: 7.weeks.ago
			},
			{
			size: "XL",
			created_at: 7.weeks.ago
			}
		]	
)


product_11 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "SP01",
	brand: "Stil Park",
	category_id: pantalons.id,
	created_at: 2.weeks.ago,
	user_id: nelly.id,
	buying_price: 5,
	price: 30,
	market_price: 25,
	color: "Jaune",
	title: "Pantalon",
	description: "Pantalon Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/pantalon_jaune_2.jpg")),
		File.open(File.join("app/assets/images/seeds/pantalon_jaune_1.jpg")),
		File.open(File.join("app/assets/images/seeds/pantalon_jaune_3.jpg")),
		File.open(File.join("app/assets/images/seeds/pantalon_jaune_4.jpg"))
	],
	variants_attributes: [
			{
			size: "M",
			created_at: 7.weeks.ago
			},
			{
			size: "L",
			created_at: 7.weeks.ago
			},
			{
			size: "XL",
			created_at: 7.weeks.ago
			}
		]
)


product_12 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "SP01",
	brand: "Stil Park",
	category_id: pantalons.id,
	created_at: 2.weeks.ago,
	user_id: nelly.id,
	buying_price: 10,
	price: 40,
	market_price: 25,
	color: "Gris",
	title: "Jean",
	description: "Pantalon ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/jean_gris_2.jpg")),
		File.open(File.join("app/assets/images/seeds/jean_gris_1.jpg")),
		File.open(File.join("app/assets/images/seeds/jean_gris_3.jpg")),
		File.open(File.join("app/assets/images/seeds/jean_gris_4.jpg"))
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 8.weeks.ago
			},
			{
			size: "M",
			created_at: 8.weeks.ago
			},
			{
			size: "L",
			created_at: 8.weeks.ago
			},
			{
			size: "XL",
			created_at: 8.weeks.ago
			}
		]
)


product_13 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "SP02",
	brand: "Stil Park",
	category_id: pantalons.id,
	created_at: 2.weeks.ago,
	user_id: nelly.id,
	buying_price: 5,
	price: 30,
	market_price: 25,
	color: "Bleu",
	title: "Jean",
	description: "Pantalon rem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/jean_bleu_3.jpg")),
		File.open(File.join("app/assets/images/seeds/jean_bleu_1.jpg")),
		File.open(File.join("app/assets/images/seeds/jean_bleu_2.jpg")),
		File.open(File.join("app/assets/images/seeds/jean_bleu_4.jpg"))
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 8.weeks.ago
			},
			{
			size: "M",
			created_at: 8.weeks.ago
			},
			{
			size: "L",
			created_at: 8.weeks.ago
			},
			{
			size: "XL",
			created_at: 8.weeks.ago
			}
		]
)


product_14 = Product.create!(
	discount_percentage: 5,
	discounted_price: 45,
	ref: "KP02",
	weight: 0.2,
	brand: "KAPORAL",
	category_id: tshirt.id,
	created_at: 2.weeks.ago,
	user_id: nelly.id,
	buying_price: 5,
	price: 50,
	market_price: 25,
	color: "Bleu",
	title: "Tshirt",
	description: "Tshirt Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_2.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/tshirt_marine_1.jpg")),
		File.open(File.join("app/assets/images/seeds/tshirt_marine_3.jpg")),
		File.open(File.join("app/assets/images/seeds/tshirt_marine_2.jpg")),
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 5.weeks.ago
			},
			{
			size: "M",
			created_at: 5.weeks.ago
			},
			{
			size: "L",
			created_at: 5.weeks.ago
			},
			{
			size: "XL",
			created_at: 5.weeks.ago
			}
		]
)

product_15 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KP02",
	brand: "KAPORAL",
	category_id: tshirt.id,
	created_at: 2.weeks.ago,
	user_id: nelly.id,
	buying_price: 5,
	price: 30,
	market_price: 25,
	color: "Blanc",
	title: "Tshirt",
	description: "Tshirt Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_2.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/tshirt_blanc_1.JPG")),
		File.open(File.join("app/assets/images/seeds/tshirt_blanc_3.JPG")),
		File.open(File.join("app/assets/images/seeds/tshirt_blanc_2.JPG")),
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 3.weeks.ago
			},
			{
			size: "M",
			created_at: 3.weeks.ago
			},
			{
			size: "L",
			created_at: 3.weeks.ago
			},
			{
			size: "XL",
			created_at: 3.weeks.ago
			}
		]
)


product_16 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KP02",
	brand: "KAPORAL",
	category_id: tshirt.id,
	created_at: 2.weeks.ago,
	user_id: nelly.id,
	buying_price: 5,
	price: 30,
	market_price: 25,
	color: "Rouge",
	title: "Tshirt",
	description: "Tshirt Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_2.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/tshirt_rouge_1.jpg")),
		File.open(File.join("app/assets/images/seeds/tshirt_rouge_3.jpg")),
		File.open(File.join("app/assets/images/seeds/tshirt_rouge_2.jpg")),
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 2.weeks.ago
			},
			{
			size: "M",
			created_at: 2.weeks.ago
			},
			{
			size: "L",
			created_at: 2.weeks.ago
			},
			{
			size: "XL",
			created_at: 2.weeks.ago
			}
		]
)

product_17 = Product.create!(
	weight: 0.2,
	discount_percentage: 50,
	discounted_price: 15,
	ref: "KP03",
	brand: "KAPORAL",
	category_id: tshirt.id,
	created_at: 2.weeks.ago,
	user_id: nelly.id,
	buying_price: 5,
	price: 30,
	market_price: 25,
	color: "Gris",
	title: "Tshirt",
	description: "Tshirt Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_2.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/tshirt_question_1.jpg")),
		File.open(File.join("app/assets/images/seeds/tshirt_question_3.jpg")),
		File.open(File.join("app/assets/images/seeds/tshirt_question_2.jpg")),
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 1.weeks.ago
			},
			{
			size: "M",
			created_at: 1.weeks.ago
			},
			{
			size: "L",
			created_at: 1.weeks.ago
			},
			{
			size: "XL",
			created_at: 1.weeks.ago
			}
		]
)



product_18 = Product.create!(
	weight: 0.2,
	discount_percentage: 50,
	discounted_price: 15,
	ref: "KP04",
	brand: "KAPORAL",
	category_id: tshirt.id,
	created_at: 2.weeks.ago,
	user_id: nelly.id,
	buying_price: 5,
	price: 30,
	market_price: 25,
	color: "Gris",
	title: "Tshirt",
	description: "Tshirt Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_2.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/tshirt_skull_1.JPG")),
		File.open(File.join("app/assets/images/seeds/tshirt_skull_2.JPG")),
		File.open(File.join("app/assets/images/seeds/tshirt_skull_3.JPG")),
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 1.weeks.ago
			},
			{
			size: "M",
			created_at: 1.weeks.ago
			},
			{
			size: "L",
			created_at: 1.weeks.ago
			},
			{
			size: "XL",
			created_at: 1.weeks.ago
			}
		]
)

product_19 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KA00" ,
	brand: "KAPORAL",
	category_id: polos.id,
	created_at: 6.weeks.ago,
	user_id: nelly.id,
	buying_price: 12,
	price: 60,
	market_price: 25,
	color: "Marine",
	title: "Polo",
	description: "Polo Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments: [
		File.open(File.join("app/assets/images/seeds/k_polo_marine_1.JPG")),
		File.open(File.join("app/assets/images/seeds/k_polo_marine_2.JPG")),
		File.open(File.join("app/assets/images/seeds/k_polo_marine_3.JPG")),
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 9.weeks.ago
			},
			{
			size: "M",
			created_at: 9.weeks.ago
			},
			{
			size: "L",
			created_at: 9.weeks.ago
			},
			{
			size: "XL",
			created_at: 9.weeks.ago
			}
		]
)


product_20 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KA00",
	brand: "Kaporal",
	category_id: polos.id,
	created_at: 9.weeks.ago,
	user_id: nelly.id,
	buying_price: 5,
	price: 20,
	market_price: 25,
	color: "Rose",
	title: "Polo",
	description: "Polo Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/k_polo_rose_1.JPG")),
		File.open(File.join("app/assets/images/seeds/k_polo_rose_2.JPG")),
		File.open(File.join("app/assets/images/seeds/k_polo_rose_3.JPG")),
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 9.weeks.ago
			},
			{
			size: "M",
			created_at: 9.weeks.ago
			},
			{
			size: "L",
			created_at: 9.weeks.ago
			},
			{
			size: "XL",
			created_at: 9.weeks.ago
			}
		]
)

product_21 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KA00",
	brand: "Kaporal",
	category_id: polos.id,
	created_at: 9.weeks.ago,
	user_id: nelly.id,
	buying_price: 5,
	price: 20,
	market_price: 25,
	color: "Jaune",
	title: "Polo",
	description: "Polo Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/k_polo_jaune_1.JPG")),
		File.open(File.join("app/assets/images/seeds/k_polo_jaune_2.JPG")),
		File.open(File.join("app/assets/images/seeds/k_polo_jaune_3.JPG")),
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 9.weeks.ago
			},
			{
			size: "M",
			created_at: 9.weeks.ago
			},
			{
			size: "L",
			created_at: 9.weeks.ago
			},
			{
			size: "XL",
			created_at: 9.weeks.ago
			}
		]
)


product_22 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KA01",
	brand: "Kaporal",
	category_id: polos.id,
	created_at: 9.weeks.ago,
	user_id: nelly.id,
	buying_price: 5,
	price: 20,
	market_price: 25,
	color: "Bleu",
	title: "Polo",
	description: "Polo Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/k_polo_motif_bleu_1.JPG")),
		File.open(File.join("app/assets/images/seeds/k_polo_motif_bleu_2.JPG")),
		File.open(File.join("app/assets/images/seeds/k_polo_motif_bleu_3.JPG")),
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 9.weeks.ago
			},
			{
			size: "M",
			created_at: 9.weeks.ago
			},
			{
			size: "L",
			created_at: 9.weeks.ago
			},
			{
			size: "XL",
			created_at: 9.weeks.ago
			}
		]
)

product_23 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KA01",
	brand: "Kaporal",
	category_id: polos.id,
	created_at: 9.weeks.ago,
	user_id: nelly.id,
	buying_price: 5,
	price: 20,
	market_price: 25,
	color: "Blanc",
	title: "Polo",
	description: "Polo Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/k_polo_motif_blanc_1.JPG")),
		File.open(File.join("app/assets/images/seeds/k_polo_motif_blanc_2.JPG")),
		File.open(File.join("app/assets/images/seeds/k_polo_motif_blanc_3.JPG")),
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 9.weeks.ago
			},
			{
			size: "M",
			created_at: 9.weeks.ago
			},
			{
			size: "L",
			created_at: 9.weeks.ago
			},
			{
			size: "XL",
			created_at: 9.weeks.ago
			}
		]
)

product_24 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KA05",
	brand: "Kaporal",
	category_id: chemise.id,
	created_at: 9.weeks.ago,
	user_id: nelly.id,
	buying_price: 5,
	price: 20,
	market_price: 25,
	color: "Orange",
	title: "Chemise",
	description: "Chemise Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/chemise_orange_1.JPG")),
		File.open(File.join("app/assets/images/seeds/chemise_orange_2.JPG")),
		File.open(File.join("app/assets/images/seeds/chemise_orange_3.JPG")),
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 9.weeks.ago
			},
			{
			size: "M",
			created_at: 9.weeks.ago
			},
			{
			size: "L",
			created_at: 9.weeks.ago
			},
			{
			size: "XL",
			created_at: 9.weeks.ago
			}
		]
)

product_25 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KA06",
	brand: "Kaporal",
	category_id: chemise.id,
	created_at: 9.weeks.ago,
	user_id: nelly.id,
	buying_price: 5,
	price: 20,
	market_price: 25,
	color: "Turquoise",
	title: "Chemise",
	description: "Chemise Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/chemise_turq_1.JPG")),
		File.open(File.join("app/assets/images/seeds/chemise_turq_2.JPG")),
		File.open(File.join("app/assets/images/seeds/chemise_turq_3.JPG")),
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 9.weeks.ago
			},
			{
			size: "M",
			created_at: 9.weeks.ago
			},
			{
			size: "L",
			created_at: 9.weeks.ago
			},
			{
			size: "XL",
			created_at: 9.weeks.ago
			}
		]
)


product_26 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KA06",
	brand: "Kaporal",
	category_id: chemise.id,
	created_at: 9.weeks.ago,
	user_id: nelly.id,
	buying_price: 5,
	price: 20,
	market_price: 25,
	color: "Rouge",
	title: "Chemise",
	description: "Chemise Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/chemise_rouge_1.JPG")),
		File.open(File.join("app/assets/images/seeds/chemise_rouge_2.JPG")),
		File.open(File.join("app/assets/images/seeds/chemise_rouge_3.JPG")),
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 9.weeks.ago
			},
			{
			size: "M",
			created_at: 9.weeks.ago
			},
			{
			size: "L",
			created_at: 9.weeks.ago
			},
			{
			size: "XL",
			created_at: 9.weeks.ago
			}
		]
)

product_27 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KA06",
	brand: "Kaporal",
	category_id: chemise.id,
	created_at: 9.weeks.ago,
	user_id: nelly.id,
	buying_price: 5,
	price: 20,
	market_price: 25,
	color: "Marine",
	title: "Chemise",
	description: "Chemise Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/chemise_marine_1.JPG")),
		File.open(File.join("app/assets/images/seeds/chemise_marine_2.JPG")),
		File.open(File.join("app/assets/images/seeds/chemise_marine_3.JPG")),
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 5.weeks.ago
			},
			{
			size: "M",
			created_at: 5.weeks.ago
			},
			{
			size: "L",
			created_at: 5.weeks.ago
			},
			{
			size: "XL",
			created_at: 5.weeks.ago
			}
		]
)


product_28 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KA06",
	brand: "Kaporal",
	category_id: chemise.id,
	created_at: 9.weeks.ago,
	user_id: nelly.id,
	buying_price: 5,
	price: 20,
	market_price: 25,
	color: "Noire",
	title: "Chemise",
	description: "Chemise Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n Doloribus porro obcaecati nam iure, reprehenderit. \n Duaerat laudantium similique illo sequi, suscipit sed accusamus facere! Id,",
	supplier_id: supplier_1.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/chemise_noire_1.JPG")),
		File.open(File.join("app/assets/images/seeds/chemise_noire_2.JPG")),
		File.open(File.join("app/assets/images/seeds/chemise_noire_3.JPG")),
	],
	variants_attributes: [
			{
			size: "S",
			created_at: 5.weeks.ago
			},
			{
			size: "M",
			created_at: 5.weeks.ago
			},
			{
			size: "L",
			created_at: 5.weeks.ago
			},
			{
			size: "XL",
			created_at: 5.weeks.ago
			}
		]
)

product_29 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KPCARMC",
	brand: "Stil Park",
	category_id: polos.id,
	user_id: nelly.id,
	buying_price: 12,
	price: 25,
	color: "Bleu Saks",
	market_price: 25,
	title: "Polo",
	description: "Polo Stil Park 100% Coton, manches courtes motif col petits carreaux",
	supplier_id: stil_park.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/IMG_9106.jpg")),
		File.open(File.join("app/assets/images/seeds/IMG_9107.jpg")),
	],
	variants_attributes: [
			{
			size: "M",
			},
			{
			size: "L",
			},
			{
			size: "XL",
			}
		]
)

product_30 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KPCARMC",
	brand: "Stil Park",
	category_id: polos.id,
	user_id: nelly.id,
	buying_price: 12,
	price: 25,
	color: "Bleu Indigo",
	market_price: 25,
	title: "Polo",
	description: "Polo Stil Park 100% Coton, manches courtes motif col petits carreaux",
	supplier_id: stil_park.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/IMG_9108.jpg")),
		File.open(File.join("app/assets/images/seeds/IMG_9109.jpg")),
	],
	variants_attributes: [
			{
			size: "M",
			},
			{
			size: "L",
			},
			{
			size: "XL",
			}
		]
)

product_31 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KPCARMC",
	brand: "Stil Park",
	category_id: polos.id,
	user_id: nelly.id,
	buying_price: 12,
	price: 25,
	color: "Bleu Mavi",
	market_price: 25,
	title: "Polo",
	description: "Polo Stil Park 100% Coton, manches courtes motif col petits carreaux",
	supplier_id: stil_park.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/IMG_9111.jpg")),
		File.open(File.join("app/assets/images/seeds/IMG_9112.jpg")),
	],
	variants_attributes: [
			{
			size: "M",
			},
			{
			size: "L",
			},
			{
			size: "XL",
			}
		]
)

product_32 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KPCARMC",
	brand: "Stil Park",
	category_id: polos.id,
	user_id: nelly.id,
	buying_price: 12,
	price: 25,
	color: "Noir Fumel",
	market_price: 25,
	title: "Polo",
	description: "Polo Stil Park 100% Coton, manches courtes motif col petits carreaux",
	supplier_id: stil_park.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/IMG_9113.jpg")),
		File.open(File.join("app/assets/images/seeds/IMG_9114.jpg")),
	],
	variants_attributes: [
			{
			size: "M",
			},
			{
			size: "L",
			},
			{
			size: "XL",
			}
		]
)


product_33 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KPCARMC",
	brand: "Stil Park",
	category_id: polos.id,
	user_id: nelly.id,
	buying_price: 12,
	price: 25,
	color: "Rose",
	market_price: 25,
	title: "Polo",
	description: "Polo Stil Park 100% Coton, manches courtes motif col petits carreaux",
	supplier_id: stil_park.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/IMG_9115.jpg")),

	],
	variants_attributes: [
			{
			size: "M",
			},
			{
			size: "L",
			},
			{
			size: "XL",
			}
		]
)

product_34 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KPCARMC",
	brand: "Stil Park",
	category_id: polos.id,
	user_id: nelly.id,
	buying_price: 12,
	price: 25,
	color: "Orange",
	market_price: 25,
	title: "Polo",
	description: "Polo Stil Park 100% Coton, manches courtes motif col petits carreaux",
	supplier_id: stil_park.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/IMG_9117.jpg")),

	],
	variants_attributes: [
			{
			size: "M",
			},
			{
			size: "L",
			},
			{
			size: "XL",
			}
		]
)


product_35 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KPCARMC",
	brand: "Stil Park",
	category_id: polos.id,
	user_id: nelly.id,
	buying_price: 12,
	price: 25,
	color: "Jaune",
	market_price: 25,
	title: "Polo",
	description: "Polo Stil Park 100% Coton, manches courtes motif col petits carreaux",
	supplier_id: stil_park.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/IMG_9118.jpg")),

	],
	variants_attributes: [
			{
			size: "M",
			},
			{
			size: "L",
			},
			{
			size: "XL",
			}
		]
)


product_36 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KPCARMC",
	brand: "Stil Park",
	category_id: polos.id,
	user_id: nelly.id,
	buying_price: 12,
	price: 25,
	color: "Gris",
	market_price: 25,
	title: "Polo",
	description: "Polo Stil Park 100% Coton, manches courtes motif col petits carreaux",
	supplier_id: stil_park.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/IMG_9119.jpg")),

	],
	variants_attributes: [
			{
			size: "M",
			},
			{
			size: "L",
			},
			{
			size: "XL",
			}
		]
)



product_37 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KPCARMC",
	brand: "Stil Park",
	category_id: polos.id,
	user_id: nelly.id,
	buying_price: 12,
	price: 25,
	color: "Beige",
	market_price: 25,
	title: "Polo",
	description: "Polo Stil Park 100% Coton, manches courtes motif col petits carreaux",
	supplier_id: stil_park.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/IMG_9121.jpg")),

	],
	variants_attributes: [
			{
			size: "M",
			},
			{
			size: "L",
			},
			{
			size: "XL",
			}
		]
)


product_38 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KPCARMC",
	brand: "Stil Park",
	category_id: polos.id,
	user_id: nelly.id,
	buying_price: 12,
	price: 25,
	color: "Gris",
	market_price: 25,
	title: "Polo",
	description: "Polo Stil Park 100% Coton, manches courtes motif col petits carreaux",
	supplier_id: stil_park.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/IMG_9122.jpg")),

	],
	variants_attributes: [
			{
			size: "M",
			},
			{
			size: "L",
			},
			{
			size: "XL",
			}
		]
)

product_39 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "KPCARMC",
	brand: "Stil Park",
	category_id: polos.id,
	user_id: nelly.id,
	buying_price: 12,
	price: 25,
	color: "Violet",
	market_price: 25,
	title: "Polo",
	description: "Polo Stil Park 100% Coton, manches courtes motif col petits carreaux",
	supplier_id: stil_park.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/IMG_9122.jpg")),

	],
	variants_attributes: [
			{
			size: "M",
			},
			{
			size: "L",
			},
			{
			size: "XL",
			}
		]
)

product_40 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "ETRO",
	brand: "ETTE",
	category_id: polos.id,
	user_id: nelly.id,
	buying_price: 12,
	price: 25,
	color: "Blanc/Marine",
	market_price: 25,
	title: "Polo",
	description: "Polo Stil Park 100% Coton, manches courtes motif col petits carreaux",
	supplier_id: stil_park.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/IMG_9128.jpg")),

	],
	variants_attributes: [
			{
			size: "M",
			},
			{
			size: "L",
			},
			{
			size: "XL",
			}
		]
)

product_41 = Product.create!(
	discount_percentage: 0,
	weight: 0.2,
	discounted_price: 0,
	ref: "ETRO",
	brand: "ETTE",
	category_id: polos.id,
	user_id: nelly.id,
	buying_price: 12,
	price: 25,
	color: "Marine",
	market_price: 25,
	title: "Polo",
	description: "Polo Stil Park 100% Coton, manches courtes motif col petits carreaux",
	supplier_id: enzo.id,
	attachments:[
		File.open(File.join("app/assets/images/seeds/IMG_9129.jpg")),

	],
	variants_attributes: [
			{
			size: "M",
			},
			{
			size: "L",
			},
			{
			size: "XL",
			}
		]
)


puts "Products and Sizes Created"

[product_1, product_2, product_3, product_4, product_13, product_15, product_17, product_18 ].each do |pd|
	pd.variants.each do |var|
	var.stocks.create!(
		quantity: 1,
		variant_id: var.id,
		supplier_id: supplier_1.id,
		price: var.product.price,
		market_price: var.product.market_price,
		cost_price: var.product.buying_price
	)
	end
end

[product_5, product_6, product_7, product_8, product_14, product_19, product_20, product_21 ].each do |pd|
	pd.variants.each do |var|
	var.stocks.create!(
		quantity: 2,
		variant_id: var.id,
		supplier_id: supplier_2.id,
		price: var.product.price,
		market_price: var.product.market_price,
		cost_price: var.product.buying_price
	)
	end
end

[product_9, product_10, product_11, product_12, product_22, product_23, product_27 ].each do |pd|
	pd.variants.each do |var|
	var.stocks.create!(
		quantity: 2,
		variant_id: var.id,
		supplier_id: supplier_1.id,
		updated_at: 5.day.ago,
		price: var.product.price,
		market_price: var.product.market_price,
		cost_price: var.product.buying_price
	)
	end
end

[ product_5, product_8, product_24, product_25, product_26].each do |pd|
	pd.variants.each do |var|
	var.stocks.create!(
		quantity: 1,
		variant_id: var.id,
		supplier_id: supplier_1.id,
		updated_at: 1.day.ago,
		price: var.product.price,
		market_price: var.product.market_price,
		cost_price: var.product.buying_price
	)
	end
end


  def remove_from_stock(sale)
    sale.items.each do |item|
      Stock.where(variant_id: item.variant_id).where('quantity > 0').order(:created_at).reduce(item.quantity.to_i) do |quantity, stock|
        if leftover = item.quantity.to_i - stock.quantity <= 0
          stock.update_attributes! quantity: stock.quantity - item.quantity.to_i 
          break
        else
          stock.update_attributes! quantity: 0
          leftover
        end
      end
    end
  end

  def remove_from_stock(order)
    order.items.each do |item|
      Stock.where(variant_id: item.variant_id).where('quantity > 0').order(:created_at).reduce(item.quantity.to_i) do |quantity, stock|
        if leftover = item.quantity.to_i - stock.quantity <= 0
          stock.update_attributes! quantity: stock.quantity - item.quantity.to_i 
          break
        else
          stock.update_attributes! quantity: 0
          leftover
        end
      end
    end
  end

#ORDER 1
order_1  = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true, 
	payment: "{'stub','stripe'}", 
	created_at: 5.months.ago, 
	user_id: user_2.id,
	token: SecureRandom.hex(8), 
	status: "full_shipped", 
	shipping_fees: 5,
	sub_total: [product_1.price + product_1.price].sum,
	total: 135,
)
	OrderItem.create!(
		weight: 0.3,
		missing_quantity: 1,
		selected: false,
		price: product_1.price, 
		order_id: order_1.id,
		quantity: 1,
		variant_id: product_1.variants[0].id,
	)
	OrderItem.create!(
		weight: 0.3,
		missing_quantity: 0,
		selected: false,
		price: product_2.price, 
		order_id: order_1.id, 
		quantity: 1,
		variant_id: product_2.variants[1].id,
	)


#ORDER 2
order_2  = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true, 
	payment: "{'stub','stripe'}", 
	created_at: 5.months.ago, 
	user_id: user_3.id,  
	token: SecureRandom.hex(8), 
	status: "partly_shipped", 
	shipping_fees: 5,
	sub_total: [product_1.price + product_1.price].sum,
	total: 135
)

	OrderItem.create!(
		weight: 0.3,

		missing_quantity: 0,
		selected: false,
		price: product_1.price, 
		order_id: order_2.id,
		quantity: 1,
		variant_id: product_1.variants[0].id
	)
	OrderItem.create!(
		weight: 0.3,

		missing_quantity: 0,
		selected: false,
		price: product_2.price, 
		order_id: order_2.id, 
		quantity: 1,
		variant_id: product_2.variants[2].id
	)

#ORDER 3
order_3  = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true, 
	payment: "{'stub','stripe'}", 
	created_at: 5.months.ago, 
	user_id: user_4.id,  
	token: SecureRandom.hex(8), 
	status: "full_shipped", 
	shipping_fees: 5,
	sub_total: [product_1.price * 2 + product_2.price * 2].sum,
	total: 135
)
	OrderItem.create!(
		weight: 0.3,
		missing_quantity: 0,
		selected: false,
		price: product_1.price, 
		order_id: order_3.id,
		quantity: 2,
		variant_id: product_1.variants[1].id
	)
	OrderItem.create!(
		weight: 0.3,
		missing_quantity: 0,
		selected: false,
		price: product_3.price, 
		order_id: order_3.id,
		quantity: 2,
		variant_id: product_3.variants[1].id
	)

#ORDER 4
order_4  = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 4.months.ago,
 	user_id: user_1.id,
 	token: SecureRandom.hex(8),
 	status: 4,
 	return_limit_date: Date.today + 10,
 	shipping_fees: 5, 
 	sub_total: product_2.price,
 	total: 135)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_2.price, 
	order_id: order_4.id,
	quantity: 1,
	variant_id: product_2.variants[1].id)

#ORDER 5
order_5  = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 4.months.ago,
 	user_id: user_5.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_2.price,
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_2.price, 
	order_id: order_5.id,
	quantity: 1,
	variant_id: product_2.variants[0].id)

#ORDER 6
order_6  = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 3.months.ago,
 	user_id: user_6.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: [product_2.price*2 + product_3.price + product_3.price].sum,
 	total: 135)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_2.price, 
	order_id: order_6.id,
	quantity: 2,
	variant_id: product_2.variants[0].id)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_3.price, 
	order_id: order_6.id,
	quantity: 1,
	variant_id: product_3.variants[0].id)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_3.price, 
	order_id: order_6.id,
	quantity: 1,
	variant_id: product_3.variants[0].id)

#ORDER 7
order_7  = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 3.months.ago,
 	user_id: user_7.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_3.price,
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_3.price, 
	order_id: order_7.id,
	quantity: 1,
	variant_id: product_3.variants[1].id)

#ORER 8
order_8  = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 3.months.ago,
 	user_id: user_8.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_3.price*2, 
 	total: 135)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_3.price, 
	order_id: order_8.id,
	quantity: 1,
	variant_id: product_3.variants[2].id
	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 1,
	selected: false,
	price: product_3.price, 
	order_id: order_8.id,
	quantity: 2,
	variant_id: product_3.variants[0].id)

#ORDER 9
order_9  = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 3.months.ago,
 	user_id: user_9.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_4.price,
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_4.price, 
	order_id: order_9.id,
	quantity: 1,
	variant_id: product_4.variants[0].id)

#ORDER 10
order_10 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 3.months.ago,
 	user_id: user_10.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_24.price,
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_24.price, 
	order_id: order_10.id, 
	quantity: 1,
	variant_id: product_24.variants[0].id)


#ORDER 11 
order_11 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 3.months.ago,
 	user_id: user_11.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_5.price * 3 , 
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_5.price, 
	order_id: order_11.id, 
	quantity: 2,
	variant_id: product_5.variants[0].id
	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_5.price, 
	order_id: order_11.id, 
	quantity: 1,
	variant_id: product_5.variants[2].id
	)

#ORDER 12
order_12 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 3.months.ago,
 	user_id: user_12.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_17.price,
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_17.price, 
	order_id: order_12.id, 
	quantity: 1,
	variant_id: product_17.variants[0].id)

#ORDER 13
order_13 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 2.months.ago,
 	user_id: user_13.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_6.price,
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_6.price, 
	order_id: order_13.id, 
	quantity: 1,
	variant_id: product_6.variants[0].id)


#ORDER 14
order_14 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 2.months.ago,
 	user_id: user_14.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_6.price,
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_6.price, 
	order_id: order_14.id, 
	quantity: 1,
	variant_id: product_6.variants[1].id)


#ORDER 15
order_15 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 2.months.ago,
 	user_id: user_15.id,
 	token: SecureRandom.hex(8),
 	status: 4,
 	return_limit_date: Date.today + 10,
 	shipping_fees: 5,
 	sub_total: product_6.price * 3, 
 	total: 135)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_8.price, 
	order_id: order_15.id, 
	quantity: 1,
	variant_id: product_8.variants[0].id)


#ORDER 16
order_16 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 2.months.ago,
 	user_id: user_16.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_28.price * 2,
 	total: 135)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_28.price, 
	order_id: order_16.id, 
	quantity: 2,
	variant_id: product_28.variants[0].id)


#ORDER 17
order_17 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 2.months.ago,
 	user_id: user_17.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_19.price,
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_19.price, 
	order_id: order_17.id, 
	quantity: 1,
	variant_id: product_19.variants[1].id)


#ORDER 18
order_18 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 2.months.ago,
 	user_id: user_18.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_20.price,
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_20.price,
	order_id: order_18.id,
	quantity: 1, 
	variant_id: product_20.variants[2].id
	)

#ORDER 21
order_21 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 1.month.ago,
 	user_id: user_19.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_21.price * 3, 
 	total: 135)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_21.price,
	order_id: order_21.id,
	quantity: 1, 
	variant_id: product_21.variants[2].id
	)

#ORDER 22
order_22 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 1.month.ago,
 	user_id: user_20.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_22.price * 3, 
 	total: 135)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_22.price,
	order_id: order_22.id,
	quantity: 1, 
	variant_id: product_22.variants[2].id
	)

#ORDER 24
order_24 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 1.month.ago,
 	user_id: user_3.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_11.price * 3,
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_11.price,
	order_id: order_24.id,
	quantity: 1, 
	variant_id: product_11.variants[1].id
	)

#ORDER 25
order_25 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 1.month.ago,
 	user_id: user_21.id,
 	token: SecureRandom.hex(8),
 	status: 4,
 	return_limit_date: Date.today + 10,
 	shipping_fees: 5,
 	sub_total: product_11.price * 3,
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_11.price,
	order_id: order_25.id,
	quantity: 1, 
	variant_id: product_1.variants[0].id)


#ORDER 26
order_26 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 1.month.ago,
 	user_id: user_1.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_11.price * 2, 
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_11.price,
	order_id: order_26.id,
	quantity: 1, 
	variant_id: product_11.variants[0].id
	)


#ORDER 27
order_27 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 4.weeks.ago,
 	user_id: user_18.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_9.price,
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_9.price, 
	order_id: order_27.id, 
	quantity: 1,
	variant_id: product_9.variants[0].id)


#ORDER 28
order_28 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 4.weeks.ago,
 	user_id: user_20.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_25.price,
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_25.price,
	order_id: order_28.id,
	quantity: 1, 
	variant_id: product_25.variants[2].id
	)

#ORDER 29
order_29 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 4.weeks.ago,
 	user_id: user_3.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_27.price,
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_27.price,
	order_id: order_29.id,
	quantity: 1, 
	variant_id: product_27.variants[2].id
	)

#ORDER 30
order_30 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 15.days.ago,
 	user_id: user_9.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_27.price * 4, 
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_27.price,
	order_id: order_30.id,
	quantity: 1, 
	variant_id: product_27.variants[0].id
	)

#ORDER 31
order_31 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 15.days.ago,
 	user_id: user_8.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_27.price * 3, 
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_27.price,
	order_id: order_31.id,
	quantity: 1, 
	variant_id: product_27.variants[1].id
	)

#ORDER 32
order_32 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 13.days.ago,
 	user_id: user_11.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_27.price * 3, 
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_27.price,
	order_id: order_32.id,
	quantity: 1, 
	variant_id: product_27.variants[0].id
	)

#ORDER 33
order_33 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 11.days.ago,
 	user_id: user_16.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_19.price * 2, 
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_19.price,
	order_id: order_33.id,
	quantity: 1, 
	variant_id: product_19.variants[1].id
	)

#ORDER 34
order_34 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 11.days.ago,
 	user_id: user_6.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_19.price * 3, 
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_19.price,
	order_id: order_34.id,
	quantity: 1, 
	variant_id: product_19.variants[1].id
	)

#ORDER 35
order_35 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 11.days.ago,
 	user_id: user_20.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_19.price, 
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_19.price,
	order_id: order_35.id,
	quantity: 1, 
	variant_id: product_19.variants[0].id
	)

#ORDER 36
order_36 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 10.days.ago,
 	user_id: user_2.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_16.price * 3, 
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_16.price,
	order_id: order_36.id,
	quantity: 1, 
	variant_id: product_16.variants[0].id
	)

#ORDER 37
order_37 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 11.days.ago,
 	user_id: user_13.id,
 	token: SecureRandom.hex(8),
 	status: "partly_shipped",
 	shipping_fees: 5,
 	sub_total: product_9.price,
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_9.price, 
	order_id: order_37.id, 
	quantity: 1,
	variant_id: product_9.variants[0].id)


#ORDER 38
order_38 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 11.days.ago,
 	user_id: user_11.id,
 	token: SecureRandom.hex(8),
 	status: "full_shipped",
 	shipping_fees: 5,
 	sub_total: product_10.price,
 	total: 135
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_10.price,
	order_id: order_38.id,
	quantity: 1, 
	variant_id: product_10.variants[0].id
	)

#ORDER 40
order_40 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 3.days.ago,
 	user_id: user_5.id,
 	token: SecureRandom.hex(8),
 	status: "pending",
 	shipping_fees: 5,
 	sub_total: product_16.price,
 	total: 400
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 0,
	selected: false,
	price: product_16.price,
	order_id: order_40.id,
	quantity: 1, 
	variant_id: product_13.variants[2].id
	)

#ORDER 41
order_41 = Order.create!(
	return_asked: false,
	total_weight: 0.5,
	gcos_accepted: true,
 	payment: "{'stub','stripe'}", 
 	created_at: 3.days.ago,
 	user_id: user_6.id,
 	token: SecureRandom.hex(8),
 	status: "paid",
 	shipping_fees: 5,
 	sub_total: product_13.price,
 	total: 400
 	)
OrderItem.create!(
	weight: 0.3,
	missing_quantity: 1,
	selected: false,
	price: product_13.price,
	order_id: order_41.id,
	quantity: 1, 
	variant_id: product_13.variants[0].id
	)

puts "Orders created"



ShippingAddress.create!(
	user_id: user_2.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"
	)



ShippingAddress.create!(
	user_id: user_3.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"
		)

ShippingAddress.create!(
	user_id: user_4.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"
		)

ShippingAddress.create!(
	user_id: user_5.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"
		)

ShippingAddress.create!(
	user_id: user_6.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"
		)

ShippingAddress.create!(
	user_id: user_7.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"
	)



ShippingAddress.create!(
	user_id: user_8.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"
		)

ShippingAddress.create!(
	user_id: user_9.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"
		)

ShippingAddress.create!(
	user_id: user_10.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"
		)

ShippingAddress.create!(
	user_id: user_11.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"
		)

ShippingAddress.create!(
	user_id: user_12.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"
		)

ShippingAddress.create!(
	user_id: user_13.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"
	)



ShippingAddress.create!(
	user_id: user_14.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"
	)



ShippingAddress.create!(
	user_id: user_15.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"
	)



ShippingAddress.create!(
	user_id: user_16.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"
	)



ShippingAddress.create!(
	user_id: user_17.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"
	)


ShippingAddress.create!(
	user_id: user_18.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"
	)


ShippingAddress.create!(
	user_id: user_19.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"
		)

ShippingAddress.create!(
	user_id: user_20.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: 42000,
	city: Faker::Address.city,
	phone: "0612789912",
	country: "FR"	
)


puts "Shipping addresses created"


#SALE_1
sale_1  = Sale.create!(
	created_at: 5.months.ago, 
	user_id: user_2.id,
	token: SecureRandom.hex(8), 
	status: 1, 
	total: 135
)

	SaleItem.create!(
		market_price: product_1.market_price, 
		sale_id: sale_1.id,
		quantity: 1,
		variant_id: product_1.variants[0].id,
	)
	SaleItem.create!(
		market_price: product_2.market_price, 
		sale_id: sale_1.id, 
		quantity: 1,
		variant_id: product_2.variants[1].id,
	)

#SALE_2
sale_2  = Sale.create!(
	created_at: 5.months.ago, 
	user_id: user_2.id,  
	token: SecureRandom.hex(8), 
	status: 1, 
	total: 135
)

	SaleItem.create!(
		market_price: product_1.market_price, 
		sale_id: sale_2.id,

		quantity: 1,
		variant_id: product_1.variants[0].id
	)
	SaleItem.create!(
		market_price: product_2.market_price, 
		sale_id: sale_2.id, 
		quantity: 1,
		variant_id: product_2.variants[2].id
	)

#SALE_3
sale_3  = Sale.create!(
	created_at: 5.months.ago, 
	user_id: user_3.id,  
	token: SecureRandom.hex(8), 
	status: 1, 
	total: 135
)
	SaleItem.create!(
		market_price: product_1.market_price, 
		sale_id: sale_3.id,
		quantity: 2,
		variant_id: product_1.variants[1].id
	)
	SaleItem.create!(
		market_price: product_3.market_price, 
		sale_id: sale_3.id,
		quantity: 2,
		variant_id: product_3.variants[1].id
	)

#SALE_4
sale_4  = Sale.create!(
 	created_at: 4.months.ago,
 	user_id: user_4.id,
 	token: SecureRandom.hex(8),
 	status: 1, 
 	total: 135)
SaleItem.create!(
	market_price: product_2.market_price, 
	sale_id: sale_4.id,
	quantity: 1,
	variant_id: product_2.variants[1].id)

#SALE_5
sale_5  = Sale.create!(
 	created_at: 4.months.ago,
 	user_id: user_5.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_2.market_price, 
	sale_id: sale_5.id,
	quantity: 1,
	variant_id: product_2.variants[0].id)

#SALE_6
sale_6  = Sale.create!(
 	created_at: 3.months.ago,
 	user_id: user_6.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135)
SaleItem.create!(
	market_price: product_2.market_price, 
	sale_id: sale_6.id,
	quantity: 2,
	variant_id: product_2.variants[0].id)
SaleItem.create!(
	market_price: product_3.market_price, 
	sale_id: sale_6.id,
	quantity: 1,
	variant_id: product_3.variants[0].id)
SaleItem.create!(
	market_price: product_3.market_price, 
	sale_id: sale_6.id,
	quantity: 1,
	variant_id: product_3.variants[0].id)

#SALE_7
sale_7  = Sale.create!(
 	created_at: 3.months.ago,
 	user_id: user_7.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_3.market_price, 
	sale_id: sale_7.id,
	quantity: 1,
	variant_id: product_3.variants[1].id)

#ORER 8
sale_8  = Sale.create!(
 	created_at: 3.months.ago,
 	user_id: user_8.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135)
SaleItem.create!(
	market_price: product_3.market_price, 
	sale_id: sale_8.id,
	quantity: 1,
	variant_id: product_3.variants[2].id
	)
SaleItem.create!(
	market_price: product_3.market_price, 
	sale_id: sale_8.id,
	quantity: 2,
	variant_id: product_3.variants[0].id)

#SALE_9
sale_9  = Sale.create!(
 	created_at: 3.months.ago,
 	user_id: user_9.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_4.market_price, 
	sale_id: sale_9.id,
	quantity: 1,
	variant_id: product_4.variants[0].id)

#SALE_10
sale_10 = Sale.create!(
 	created_at: 3.months.ago,
 	user_id: user_10.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_4.market_price, 
	sale_id: sale_10.id, 
	quantity: 1,
	variant_id: product_4.variants[0].id)


#SALE_11 
sale_11 = Sale.create!(
 	created_at: 3.months.ago,
 	user_id: user_11.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_5.market_price, 
	sale_id: sale_11.id, 
	quantity: 2,
	variant_id: product_5.variants[0].id
	)
SaleItem.create!(
	market_price: product_5.market_price, 
	sale_id: sale_11.id, 
	quantity: 1,
	variant_id: product_5.variants[2].id
	)


#SALE_12
sale_12 = Sale.create!(
 	created_at: 3.months.ago,
 	user_id: user_12.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_7.market_price, 
	sale_id: sale_12.id, 
	quantity: 1,
	variant_id: product_7.variants[0].id)


#SALE_13
sale_13 = Sale.create!(
 	created_at: 2.months.ago,
 	user_id: user_13.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_6.market_price, 
	sale_id: sale_13.id, 
	quantity: 1,
	variant_id: product_6.variants[0].id)


#SALE_14
sale_14 = Sale.create!(
 	created_at: 2.months.ago,
 	user_id: user_14.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_6.market_price, 
	sale_id: sale_14.id, 
	quantity: 1,
	variant_id: product_6.variants[1].id)

#SALE_17
sale_17 = Sale.create!(
 	created_at: 2.months.ago,
 	user_id: user_17.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_9.market_price, 
	sale_id: sale_17.id, 
	quantity: 1,
	variant_id: product_9.variants[1].id)


#SALE_18
sale_18 = Sale.create!(
 	created_at: 2.months.ago,
 	user_id: user_17.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_10.market_price,
	sale_id: sale_18.id,
	quantity: 1, 
	variant_id: product_10.variants[2].id
	)

#SALE_19
sale_19 = Sale.create!(
 	created_at: 2.months.ago,
 	user_id: user_18.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_14.market_price,
	sale_id: sale_19.id,
	quantity: 1, 
	variant_id: product_14.variants[1].id
	)

#SALE_20
sale_20 = Sale.create!(
 	created_at: Time.now, 
 	user_id: user_4.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135)
SaleItem.create!(
	market_price: product_14.market_price,
	sale_id: sale_20.id,
	quantity: 1, 
	variant_id: product_14.variants[2].id
	)

#SALE_21
sale_21 = Sale.create!(
 	created_at: 1.month.ago,
 	user_id: user_4.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135)
SaleItem.create!(
	market_price: product_14.market_price,
	sale_id: sale_21.id,
	quantity: 1, 
	variant_id: product_14.variants[2].id
	)

#SALE_22
sale_22 = Sale.create!(
 	created_at: 1.month.ago,
 	user_id: user_4.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135)
SaleItem.create!(
	market_price: product_24.market_price,
	sale_id: sale_20.id,
	quantity: 1, 
	variant_id: product_24.variants[2].id
	)

#SALE_23
sale_23 = Sale.create!(
 	created_at: 1.month.ago,
 	user_id: user_4.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135)
SaleItem.create!(
	market_price: product_24.market_price,
	sale_id: sale_23.id,
	quantity: 1, 
	variant_id: product_24.variants[0].id
	)

#SALE_24
sale_24 = Sale.create!(
 	created_at: 1.month.ago,
 	user_id: user_4.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_24.market_price,
	sale_id: sale_24.id,
	quantity: 1, 
	variant_id: product_24.variants[1].id
	)

#SALE_25
sale_25 = Sale.create!(
 	created_at: 1.month.ago,
 	user_id: user_4.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_11.market_price,
	sale_id: sale_25.id,
	quantity: 1, 
	variant_id: product_11.variants[0].id)


#SALE_26
sale_26 = Sale.create!(
 	created_at: 1.month.ago,
 	user_id: user_4.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)

#SALE_27
sale_27 = Sale.create!(
 	created_at: 4.weeks.ago,
 	user_id: user_17.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_9.market_price, 
	sale_id: sale_27.id, 
	quantity: 1,
	variant_id: product_9.variants[0].id)


#SALE_28
sale_28 = Sale.create!(
 	created_at: 4.weeks.ago,
 	user_id: user_17.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_10.market_price,
	sale_id: sale_28.id,
	quantity: 1, 
	variant_id: product_10.variants[2].id
	)

#SALE_29
sale_29 = Sale.create!(
 	created_at: 4.weeks.ago,
 	user_id: user_18.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_11.market_price,
	sale_id: sale_29.id,
	quantity: 1, 
	variant_id: product_11.variants[2].id
	)

#SALE_30
sale_30 = Sale.create!(
 	created_at: 15.days.ago,
 	user_id: user_4.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)

#SALE_31
sale_31 = Sale.create!(
 	created_at: 15.days.ago,
 	user_id: user_4.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)



#SALE_33
sale_33 = Sale.create!(
 	created_at: 11.days.ago,
 	user_id: user_4.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_12.market_price,
	sale_id: sale_33.id,
	quantity: 1, 
	variant_id: product_12.variants[1].id
	)

#SALE_34
sale_34 = Sale.create!(
 	created_at: 11.days.ago,
 	user_id: user_4.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_12.market_price,
	sale_id: sale_34.id,
	quantity: 1, 
	variant_id: product_12.variants[1].id
	)

#SALE_35
sale_35 = Sale.create!(
 	created_at: 11.days.ago,
 	user_id: user_4.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_12.market_price,
	sale_id: sale_35.id,
	quantity: 1, 
	variant_id: product_12.variants[0].id
	)

#SALE_36
sale_36 = Sale.create!(
 	created_at: 11.days.ago,
 	user_id: user_4.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_12.market_price,
	sale_id: sale_36.id,
	quantity: 1, 
	variant_id: product_12.variants[0].id
	)

#SALE_37
sale_37 = Sale.create!(
 	created_at: 11.days.ago,
 	user_id: user_17.id,
 	token: SecureRandom.hex(8),
 	status: 1,
 	total: 135
 	)
SaleItem.create!(
	market_price: product_9.market_price, 
	sale_id: sale_37.id, 
	quantity: 1,
	variant_id: product_9.variants[0].id)

	puts "Sales created"


Order.all.each do |order|
	remove_from_stock(order)
end

Sale.all.each do |sale|
	remove_from_stock(sale)
end