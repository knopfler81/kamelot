Category.destroy_all
Order.destroy_all
Product.destroy_all
BillingAddress.destroy_all
ShippingAddress.destroy_all
User.destroy_all

puts "Seeds cleaned"

nelly = User.create!(
	admin: true,
	email: "nelly@example.com", 
	password: "password", 
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: "Nelly",
	last_name: "Duclos",
	phone: Faker::PhoneNumber.phone_number,
	created_at: 10.months.ago
	)

user_1 = User.create!(
	admin: false,
	email: "guest1@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 9.months.ago
)

user_2 = User.create!(
	admin: false,
	email: "guest2@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 8.months.ago
)

user_3 = User.create!(
	admin: false,
	email: "guest3@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 8.months.ago
)
user_4 = User.create!(
	admin: false,
	email: "guest4@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 7.months.ago - 20.days
)
user_5 = User.create!(
	admin: false,
	email: "guest5@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 7.months.ago - 12.days
)
user_6 = User.create!(
	admin: false,
	email: "guest6@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 7.months.ago - 6.days
)

user_7 = User.create!(
	admin: false,
	email: "guest7@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 7.months.ago - 2.days
)

user_8 = User.create!(
	admin: false,
	email: "guest8@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 6.months.ago  - 24.days
)

user_9 = User.create!(
	admin: false,
	email: "guest9@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 6.months.ago - 3.days
)
user_10 = User.create!(
	admin: false,
	email: "guest10@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 6.months.ago - 1.day
)
user_11 = User.create!(
	admin: false,
	email: "guest11@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 6.months.ago
)
user_12 = User.create!(
	admin: false,
	email: "guest12@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 5.months.ago - 1.week
)

user_13 = User.create!(
	admin: false,
	email: "guest13@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 5.months.ago - 1.week
)

user_14 = User.create!(
	admin: false,
	email: "guest14@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 3.months.ago 
)

user_15 = User.create!(
	admin: false,
	email: "guest15@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 3.months.ago 
)
user_16 = User.create!(
	admin: false,
	email: "guest16@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 3.months.ago 
)
user_17 = User.create!(
	admin: false,
	email: "guest17@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 6.weeks.ago - 4.days
)
user_18 = User.create!(
	admin: false,
	email: "guest18@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 6.weeks.ago - 1.day
)

user_19 = User.create!(
	admin: false,
	email: "guest19@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 6.weeks.ago 
)

user_20 = User.create!(
	admin: false,
	email: "guest20@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 3.weeks.ago 
)

user_21 = User.create!(
	admin: false,
	email: "guest21@example.com",
	password: "password",
	password_confirmation: "password",
	gender: ["Monsieur", "Madame"].sample,
	birth_date: 30.years.ago,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	phone: Faker::PhoneNumber.phone_number,
	created_at: 1.week.ago 
)

puts "Users & admin created"

pulls 			= Category.create(title: "Pulls")
pantalons 	= Category.create(title: "Pantalons")
tshirt 			= Category.create(title: "Tshirts")
accessoires = Category.create(title: "Accessoires")
chemises 		= Category.create(title: "Chemises")

puts "Categories created"


product_1 = Product.create!(
	ref: "SP00",
	brand: "Side Park",
	category_id: pulls.id,
	created_at: 10.weeks.ago,
	user_id: nelly.id,
	price_cents: 30,
	color: "Noir",
	title: "Pull",
	description: "Pull très chaud en laine blablablabalbla",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_4.jpg"))
	],
	sizes_attributes: [
			{
			size_name: "S",
			quantity: 10
			},
			{
			size_name: "M",
			quantity: 3
			},
			{
			size_name: "L",
			quantity: 42,
			},
			{
			size_name: "XL",
			quantity: 21
			}
		]
)


product_2 = Product.create(
	ref: "GU00",
	brand: "Guess",
	category_id: pulls.id,
	created_at: 10.weeks.ago,
	user_id: nelly.id,
	price_cents: 40,
	color: "Blanc",
	title: "Pull",
	description: "Pull très chaud en laine blablablabalbla",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_blanc_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_blanc_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_blanc_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_blanc_4.jpg"))
	],
	sizes_attributes: [
			{
			size_name: "S",
			quantity: 12
			},
			{
			size_name: "M",
			quantity: 30
			},
			{
			size_name: "L",
			quantity: 1,
			},
			{
			size_name: "XL",
			quantity: 14
			}
		]
)


product_3 = Product.create(
	ref:"SP00" ,
	brand: "Side Park",
	category_id: pulls.id,
	created_at: 10.weeks.ago,
	user_id: nelly.id,
	price_cents: 45,
	color: "Rouge",
	title: "Pull",
	description: "Pull très chaud en laine blablablabalbla",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_rouge_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_rouge_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_rouge_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_rouge_4.jpg"))
	],
	sizes_attributes: [
			{
			size_name: "S",
			quantity: 31
			},
			{
			size_name: "M",
			quantity: 12
			},
			{
			size_name: "L",
			quantity: 4,
			},
			{
			size_name: "XL",
			quantity: 2
			}
		]
)


product_4 = Product.create(
	ref: "LE00",
	brand: "Levis",
	category_id: pantalons.id,
	created_at: 10.weeks.ago,
	user_id: nelly.id,
	price_cents: 49,
	color: "Jaune",
	title: "Pantalon",
	description: "Pantalon blablablabalbla",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/pantalon_jaune_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pantalon_jaune_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pantalon_jaune_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pantalon_jaune_4.jpg"))
	],
	sizes_attributes: [
			{
			size_name: "S",
			quantity: 3
			},
			{
			size_name: "M",
			quantity: 9
			},
			{
			size_name: "L",
			quantity: 4,
			},
			{
			size_name: "XL",
			quantity: 10
			}
		]
)


product_5 = Product.create(
	ref: "LE00" ,
	brand: "Levis",
	category_id: pantalons.id,
	created_at: 6.weeks.ago,
	user_id: nelly.id,
	price_cents: 60,
	color: "Gris",
	title: "Jean",
	description: "Paalablalntalon blab",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_gris_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_gris_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_gris_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_gris_4.jpg"))
	],
	sizes_attributes: [
			{
			size_name: "S",
			quantity: 12
			},
			{
			size_name: "M",
			quantity: 8
			},
			{
			size_name: "L",
			quantity: 9,
			},
			{
			size_name: "XL",
			quantity: 21
			}
		]
)


product_6 = Product.create(
	ref: "KA00",
	brand: "Kaporal",
	category_id: pantalons.id,
	created_at: 6.weeks.ago,
	user_id: nelly.id,
	price_cents: 20,
	color: "Bleu",
	title: "Jean",
	description: "Paalablalntalon blab",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_bleu_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_bleu_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_bleu_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_bleu_4.jpg"))
	],
	sizes_attributes: [
			{
			size_name: "S",
			quantity: 2
			},
			{
			size_name: "M",
			quantity: 11
			},
			{
			size_name: "L",
			quantity: 7,
			},
			{
			size_name: "XL",
			quantity: 2
			}
		]
)

product_7 = Product.create!(
	ref: "SP00",
	brand: "Side Park",
	category_id: pulls.id,
	created_at: 6.weeks.ago,
	user_id: nelly.id,
	price_cents: 45,
	color: "Noir",
	title: "Pull",
	description: "Pull très chaud en laine blablablabalbla",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_4.jpg"))
	],
	sizes_attributes: [
			{
			size_name: "S",
			quantity: 9
			},
			{
			size_name: "M",
			quantity: 3
			},
			{
			size_name: "L",
			quantity: 4,
			},
			{
			size_name: "XL",
			quantity: 2
			}
		]
)

product_8 = Product.create(
	ref: "GU00",
	brand: "Guess",
	category_id: pulls.id,
	created_at: 6.weeks.ago,
	user_id: nelly.id,
	price_cents: 30,
	color: "Vert",
	title: "Pull",
	description: "Pull très chaud en laine blablablabalbla",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_vert_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_vert_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_vert_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_vert_4.jpg"))
	],
	sizes_attributes: [
			{
			size_name: "S",
			quantity: 8
			},
			{
			size_name: "M",
			quantity: 3
			},
			{
			size_name: "L",
			quantity: 5,
			},
			{
			size_name: "XL",
			quantity: 9
			}
		]
)

product_9 = Product.create(
	ref: "GU00",
	brand: "Guess",
	category_id: pulls.id,
	created_at: 5.weeks.ago,
	user_id: nelly.id,
	price_cents: 70,
	color: "Beige",
	title: "Pull",
	description: "Pull très chaud en laine blablablabalbla",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_beige_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_beige_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_beige_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_beige_4.jpg"))
	],
	sizes_attributes: [
			{
			size_name: "S",
			quantity: 7
			},
			{
			size_name: "M",
			quantity: 2
			},
			{
			size_name: "L",
			quantity: 9,
			},
			{
			size_name: "XL",
			quantity: 7
			}
		]	
)

product_10 = Product.create(
	ref: "GU00",
	brand: "Guess",
	category_id: pulls.id,
	created_at: 5.weeks.ago,
	user_id: nelly.id,
	price_cents: 70,
	color: "Camel",
	title: "Pull",
	description: "Pull très chaud en laine blablablabalbla",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_camel_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_camel_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_camel_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_camel_4.jpg"))
	],
	sizes_attributes: [
			{
			size_name: "S",
			quantity: 18
			},
			{
			size_name: "M",
			quantity: 7
			},
			{
			size_name: "L",
			quantity: 21,
			},
			{
			size_name: "XL",
			quantity: 2
			}
		]	
)


product_11 = Product.create(
	ref: "SP01",
	brand: "Side Park",
	category_id: pantalons.id,
	created_at: 2.weeks.ago,
	user_id: nelly.id,
	price_cents: 39,
	color: "Jaune",
	title: "Pantalon",
	description: "Pantalon blablablabalbla",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/pantalon_jaune_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pantalon_jaune_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pantalon_jaune_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pantalon_jaune_4.jpg"))
	],
	sizes_attributes: [
			{
			size_name: "S",
			quantity: 21
			},
			{
			size_name: "M",
			quantity: 37
			},
			{
			size_name: "L",
			quantity: 8,
			},
			{
			size_name: "XL",
			quantity: 29
			}
		]
)


product_12 = Product.create(
	ref: "SP01",
	brand: "Side Park",
	category_id: pantalons.id,
	created_at: 2.weeks.ago,
	user_id: nelly.id,
	price_cents: 45,
	color: "Gris",
	title: "Jean",
	description: "Paalablalntalon blab",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_gris_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_gris_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_gris_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_gris_4.jpg"))
	],
	sizes_attributes: [
			{
			size_name: "S",
			quantity: 12
			},
			{
			size_name: "M",
			quantity: 32
			},
			{
			size_name: "L",
			quantity: 19,
			},
			{
			size_name: "XL",
			quantity: 21
			}
		]
)


product_13 = Product.create(
	ref: "SP02",
	brand: "Side Park",
	category_id: pantalons.id,
	created_at: 2.weeks.ago,
	user_id: nelly.id,
	price_cents: 30,
	color: "Bleu",
	title: "Jean",
	description: "Paalablalntalon blab",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_bleu_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_bleu_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_bleu_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_bleu_4.jpg"))
	],
	sizes_attributes: [
			{
			size_name: "S",
			quantity: 20
			},
			{
			size_name: "M",
			quantity: 4
			},
			{
			size_name: "L",
			quantity: 52,
			},
			{
			size_name: "XL",
			quantity: 24
			}
		]
)




puts "Products Created"

# size_1 = Size.create(size_name: "S", quantity: 10, product_id: product_1.id)
# size_2 = Size.create(size_name: "M", quantity: 10, product_id: product_1.id)
# size_3 = Size.create(size_name: "L", quantity: 10, product_id: product_1.id)
# size_4 = Size.create(size_name: "XL", quantity: 10, product_id: product_1.id)

# size_5 = Size.create(size_name: "S", quantity: 10, product_id: product_2.id)
# size_6 = Size.create(size_name: "M", quantity: 10, product_id: product_2.id)
# size_7 = Size.create(size_name: "L", quantity: 10, product_id: product_2.id)
# size_8 = Size.create(size_name: "XL", quantity: 10, product_id: product_2.id)

# size_9 = Size.create(size_name: "S", quantity: 10, product_id: product_3.id)
# size_10 = Size.create(size_name: "M", quantity: 10, product_id: product_3.id)
# size_12 = Size.create(size_name: "L", quantity: 10, product_id: product_3.id)
# size_13 = Size.create(size_name: "XL", quantity: 10, product_id: product_3.id)

# size_14 = Size.create(size_name: "S", quantity: 10, product_id: product_4.id)
# size_15 = Size.create(size_name: "M", quantity: 10, product_id: product_4.id)
# size_16 = Size.create(size_name: "L", quantity: 10, product_id: product_4.id)
# size_17 = Size.create(size_name: "XL", quantity: 10, product_id: product_4.id)

# size_18 = Size.create(size_name: "S", quantity: 10, product_id: product_5.id)
# size_19 = Size.create(size_name: "M", quantity: 10, product_id: product_5.id)
# size_20 = Size.create(size_name: "L", quantity: 10, product_id: product_5.id)
# size_21 = Size.create(size_name: "XL", quantity: 10, product_id: product_5.id)

# size_22 = Size.create(size_name: "S", quantity: 10, product_id: product_6.id)
# size_23 = Size.create(size_name: "M", quantity: 10, product_id: product_6.id)
# size_24 = Size.create(size_name: "L", quantity: 10, product_id: product_6.id)
# size_25 = Size.create(size_name: "XL", quantity: 10, product_id: product_6.id)

# size_26 = Size.create(size_name: "S", quantity: 10, product_id: product_7.id)
# size_27 = Size.create(size_name: "M", quantity: 10, product_id: product_7.id)
# size_28 = Size.create(size_name: "L", quantity: 10, product_id: product_7.id)
# size_29 = Size.create(size_name: "XL", quantity: 10, product_id: product_7.id)

# size_30 = Size.create(size_name: "S", quantity: 10, product_id: product_8.id)
# size_31 = Size.create(size_name: "M", quantity: 10, product_id: product_8.id)
# size_34 = Size.create(size_name: "L", quantity: 10, product_id: product_8.id)
# size_35 = Size.create(size_name: "XL", quantity: 10, product_id: product_8.id)

# size_36 = Size.create(size_name: "S", quantity: 10, product_id: product_9.id)
# size_37 = Size.create(size_name: "M", quantity: 10, product_id: product_9.id)
# size_38 = Size.create(size_name: "L", quantity: 10, product_id: product_9.id)
# size_39 = Size.create(size_name: "XL", quantity: 10, product_id: product_9.id)

# size_40 = Size.create(size_name: "S", quantity: 10, product_id: product_10.id)
# size_41 = Size.create(size_name: "M", quantity: 10, product_id: product_10.id)
# size_42 = Size.create(size_name: "L", quantity: 10, product_id: product_10.id)
# size_42 = Size.create(size_name: "XL", quantity: 10, product_id: product_10.id)

# size_43 = Size.create(size_name: "S", quantity: 10, product_id: product_11.id)
# size_44 = Size.create(size_name: "M", quantity: 10, product_id: product_11.id)
# size_45 = Size.create(size_name: "L", quantity: 10, product_id: product_11.id)
# size_46 = Size.create(size_name: "XL", quantity: 10, product_id: product_11.id)

# size_47 = Size.create(size_name: "S", quantity: 10, product_id: product_12.id)
# size_48 = Size.create(size_name: "M", quantity: 10, product_id: product_12.id)
# size_49 = Size.create(size_name: "L", quantity: 10, product_id: product_12.id)
# size_50 = Size.create(size_name: "XL", quantity: 10, product_id: product_12.id)

# size_51 = Size.create(size_name: "S", quantity: 10, product_id: product_13.id)
# size_52 = Size.create(size_name: "M", quantity: 10, product_id: product_13.id)
# size_53 = Size.create(size_name: "L", quantity: 10, product_id: product_13.id)
# size_54 = Size.create(size_name: "XL", quantity: 10, product_id: product_13.id)

#puts "Sizes created"

#ORDER 1
order_1  = Order.create(payment: "{'stub','stripe'}", created_at: 5.months.ago, user_id: user_2.id,  token: SecureRandom.hex(8), status: 3, shipping_fees_cents: 5, sub_total_cents: [product_1.price_cents + product_1.price_cents].sum , total_cents: 200)
OrderItem.create(price: product_1.price_cents, order_id: order_1.id, product_id: product_1.id, quantity: 1, size_id: product_1.sizes[0].id)
OrderItem.create(price: product_2.price_cents, order_id: order_1.id, product_id: product_2.id, quantity: 1, size_id: product_2.sizes[1].id)

#ORDER 2
order_2  = Order.create(payment: "{'stub','stripe'}", created_at: 5.months.ago, user_id: user_2.id,  token: SecureRandom.hex(8), status: 3, shipping_fees_cents: 5, sub_total_cents: [product_1.price_cents + product_1.price_cents].sum , total_cents: 200)
OrderItem.create(price: product_1.price_cents, order_id: order_2.id, product_id: product_1.id, quantity: 1, size_id: product_1.sizes[0].id)
OrderItem.create(price: product_2.price_cents, order_id: order_2.id, product_id: product_2.id, quantity: 1, size_id: product_2.sizes[2].id)

#ORDER 3
order_3  = Order.create(payment: "{'stub','stripe'}", created_at: 5.months.ago, user_id: user_3.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: [product_1.price_cents * 2 + product_2.price_cents * 2].sum , total_cents: 200)
OrderItem.create(price: product_1.price_cents, order_id: order_3.id, product_id: product_1.id, quantity: 2, size_id: product_1.sizes[0].id)
OrderItem.create(price: product_3.price_cents, order_id: order_3.id, product_id: product_3.id, quantity: 2, size_id: product_3.sizes[1].id)

#ORDER 4
order_4  = Order.create(payment: "{'stub','stripe'}", created_at: 4.months.ago - 5.days, user_id: user_4.id,  token: SecureRandom.hex(8), status: 4, shipping_fees_cents: 5, sub_total_cents: product_2.price_cents , total_cents: 200)
OrderItem.create(price: product_2.price_cents, order_id: order_4.id, product_id: product_2.id, quantity: 1, size_id: product_2.sizes[0].id)

#ORDER 5
order_5  = Order.create(payment: "{'stub','stripe'}", created_at: 4.months.ago, user_id: user_5.id,  token: SecureRandom.hex(8), status: 5, shipping_fees_cents: 5, sub_total_cents: product_2.price_cents , total_cents: 200)
OrderItem.create(price: product_2.price_cents, order_id: order_5.id, product_id: product_2.id, quantity: 1, size_id: product_2.sizes[0].id)

#ORDER 6
order_6  = Order.create(payment: "{'stub','stripe'}", created_at: 3.months.ago, user_id: user_6.id,  token: SecureRandom.hex(8), status: 3, shipping_fees_cents: 5, sub_total_cents: [product_2.price_cents * 2 + product_3.price_cents + product_3.price_cents].sum , total_cents: 200)
OrderItem.create(price: product_2.price_cents, order_id: order_6.id, product_id: product_2.id, quantity: 2, size_id: product_2.sizes[0].id)
OrderItem.create(price: product_3.price_cents, order_id: order_6.id, product_id: product_3.id, quantity: 1, size_id: product_3.sizes[0].id)
OrderItem.create(price: product_3.price_cents, order_id: order_6.id, product_id: product_3.id, quantity: 1, size_id: product_3.sizes[0].id)

#ORDER 7
order_7  = Order.create(payment: "{'stub','stripe'}", created_at: 3.months.ago, user_id: user_7.id,  token: SecureRandom.hex(8), status: 3, shipping_fees_cents: 5, sub_total_cents: product_3.price_cents , total_cents: 200)
OrderItem.create(price: product_3.price_cents, order_id: order_7.id, product_id: product_3.id, quantity: 1, size_id: product_3.sizes[1].id)

#ORER 8
order_8  = Order.create(payment: "{'stub','stripe'}", created_at: 3.months.ago, user_id: user_8.id,  token: SecureRandom.hex(8), status: 3, shipping_fees_cents: 5, sub_total_cents: product_3.price_cents * 2 , total_cents: 200)
OrderItem.create(price: product_3.price_cents, order_id: order_8.id, product_id: product_3.id, quantity: 1, size_id: product_3.sizes[2].id)
OrderItem.create(price: product_3.price_cents, order_id: order_8.id, product_id: product_3.id, quantity: 2, size_id: product_3.sizes[0].id)

#ORDER 9
order_9  = Order.create(payment: "{'stub','stripe'}", created_at: 3.months.ago, user_id: user_9.id,  token: SecureRandom.hex(8), status: 5, shipping_fees_cents: 5, sub_total_cents: product_4.price_cents , total_cents: 200)
OrderItem.create(price: product_4.price_cents, order_id: order_9.id, product_id: product_4.id, quantity: 1, size_id: product_4.sizes[0].id)

#ORDER 10
order_10 = Order.create(payment: "{'stub','stripe'}", created_at: 3.months.ago, user_id: user_10.id, token: SecureRandom.hex(8), status: 3, shipping_fees_cents: 5, sub_total_cents: product_4.price_cents , total_cents: 200)
OrderItem.create(price: product_4.price_cents, order_id: order_10.id, product_id: product_4.id, quantity: 1, size_id: product_4.sizes[0].id)

#ORDER 11 
order_11 = Order.create(payment: "{'stub','stripe'}", created_at: 3.months.ago, user_id: user_11.id, token: SecureRandom.hex(8), status: 4, shipping_fees_cents: 5, sub_total_cents: product_5.price_cents * 3 , total_cents: 200)
OrderItem.create(price: product_5.price_cents, order_id: order_11.id, product_id: product_5.id, quantity: 2, size_id: product_5.sizes[0].id)
OrderItem.create(price: product_5.price_cents, order_id: order_11.id, product_id: product_5.id, quantity: 1, size_id: product_5.sizes[2].id)

#ORDER 12
order_12 = Order.create(payment: "{'stub','stripe'}", created_at: 3.months.ago, user_id: user_12.id, token: SecureRandom.hex(8), status: 3, shipping_fees_cents: 5, sub_total_cents: product_7.price_cents, total_cents: 200)
OrderItem.create(price: product_7.price_cents, order_id: order_12.id, product_id: product_7.id, quantity: 1, size_id: product_7.sizes[0].id)

#ORDER 13
order_13 = Order.create(payment: "{'stub','stripe'}", created_at: 2.months.ago, user_id: user_13.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_6.price_cents, total_cents: 200)
OrderItem.create(price: product_6.price_cents, order_id: order_13.id, product_id: product_6.id, quantity: 1, size_id: product_6.sizes[0].id)

#ORDER 14
order_14 = Order.create(payment: "{'stub','stripe'}", created_at: 2.months.ago, user_id: user_14.id, token: SecureRandom.hex(8), status: 2, shipping_fees_cents: 5, sub_total_cents: product_6.price_cents, total_cents: 200)
OrderItem.create(price: product_6.price_cents, order_id: order_14.id, product_id: product_6.id, quantity: 1, size_id: product_6.sizes[1].id)

#ORDER 15
order_15 = Order.create(payment: "{'stub','stripe'}", created_at: 2.months.ago, user_id: user_15.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_6.price_cents * 3 , total_cents: 200)
OrderItem.create(price: product_8.price_cents, order_id: order_15.id, product_id: product_8.id, quantity: 3, size_id: product_8.sizes[0].id)

#ORDER 16
order_16 = Order.create(payment: "{'stub','stripe'}", created_at: 2.months.ago, user_id: user_16.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_8.price_cents * 2 , total_cents: 200)
OrderItem.create(price: product_8.price_cents, order_id: order_16.id, product_id: product_8.id, quantity: 2, size_id: product_8.sizes[0].id)

#ORDER 17
order_17 = Order.create(payment: "{'stub','stripe'}", created_at: 2.months.ago, user_id: user_17.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_9.price_cents, total_cents: 200)
OrderItem.create(price: product_9.price_cents, order_id: order_17.id, product_id: product_9.id, quantity: 1, size_id: product_9.sizes[1].id)

#ORDER 18
order_18 = Order.create(payment: "{'stub','stripe'}", created_at: 2.months.ago, user_id: user_17.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_10.price_cents, total_cents: 200)
OrderItem.create(price: product_10.price_cents, order_id: order_18.id, product_id: product_10.id, quantity: 1, size_id: product_10.sizes[2].id)

#ORDER 19
order_19 = Order.create(payment: "{'stub','stripe'}", created_at: 2.months.ago, user_id: user_18.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_19.id, product_id: product_11.id, quantity: 1, size_id: product_11.sizes[1].id)

#ORDER 20
order_20 = Order.create(payment: "{'stub','stripe'}", created_at: Time.now, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_20.id, product_id: product_11.id, quantity: 3, size_id: product_11.sizes[3].id)

#ORDER 21
order_21 = Order.create(payment: "{'stub','stripe'}", created_at: 1.month.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_21.id, product_id: product_11.id, quantity: 3, size_id: product_11.sizes[3].id)

#ORDER 22
order_22 = Order.create(payment: "{'stub','stripe'}", created_at: 1.month.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_20.id, product_id: product_11.id, quantity: 3, size_id: product_11.sizes[2].id)

#ORDER 23
order_23 = Order.create(payment: "{'stub','stripe'}", created_at: 1.month.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_23.id, product_id: product_11.id, quantity: 3, size_id: product_11.sizes[0].id)

#ORDER 24
order_24 = Order.create(payment: "{'stub','stripe'}", created_at: 1.month.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_24.id, product_id: product_11.id, quantity: 3, size_id: product_11.sizes[1].id)

#ORDER 25
order_25 = Order.create(payment: "{'stub','stripe'}", created_at: 1.month.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_25.id, product_id: product_11.id, quantity: 3, size_id: product_1.sizes[0].id)

#ORDER 26
order_26 = Order.create(payment: "{'stub','stripe'}", created_at: 1.month.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_26.id, product_id: product_11.id, quantity: 3, size_id: product_11.sizes[0].id)


#ORDER 27
order_27 = Order.create(payment: "{'stub','stripe'}", created_at: 4.weeks.ago, user_id: user_17.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_9.price_cents, total_cents: 200)
OrderItem.create(price: product_9.price_cents, order_id: order_27.id, product_id: product_9.id, quantity: 1, size_id: product_9.sizes[0].id)

#ORDER 28
order_28 = Order.create(payment: "{'stub','stripe'}", created_at: 4.weeks.ago, user_id: user_17.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_10.price_cents, total_cents: 200)
OrderItem.create(price: product_10.price_cents, order_id: order_28.id, product_id: product_10.id, quantity: 1, size_id: product_10.sizes[2].id)

#ORDER 29
order_29 = Order.create(payment: "{'stub','stripe'}", created_at: 4.weeks.ago, user_id: user_18.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_29.id, product_id: product_11.id, quantity: 1, size_id: product_11.sizes[3].id)

#ORDER 30
order_30 = Order.create(payment: "{'stub','stripe'}", created_at: 15.days.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_30.id, product_id: product_11.id, quantity: 3, size_id: product_11.sizes[0].id)

#ORDER 31
order_31 = Order.create(payment: "{'stub','stripe'}", created_at: 15.days.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_31.id, product_id: product_11.id, quantity: 3, size_id: product_11.sizes[1].id)

#ORDER 32
order_32 = Order.create(payment: "{'stub','stripe'}", created_at: 13.days.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_32.id, product_id: product_11.id, quantity: 3, size_id: product_11.sizes[0].id)

#ORDER 33
order_33 = Order.create(payment: "{'stub','stripe'}", created_at: 11.days.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_12.price_cents, order_id: order_33.id, product_id: product_12.id, quantity: 3, size_id: product_12.sizes[0].id)

#ORDER 34
order_34 = Order.create(payment: "{'stub','stripe'}", created_at: 11.days.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_12.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_12.price_cents, order_id: order_34.id, product_id: product_12.id, quantity: 3, size_id: product_12.sizes[1].id)

#ORDER 35
order_35 = Order.create(payment: "{'stub','stripe'}", created_at: 11.days.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_12.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_12.price_cents, order_id: order_35.id, product_id: product_12.id, quantity: 3, size_id: product_12.sizes[0].id)

#ORDER 36
order_36 = Order.create(payment: "{'stub','stripe'}", created_at: 11.days.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_12.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_12.price_cents, order_id: order_36.id, product_id: product_12.id, quantity: 3, size_id: product_12.sizes[0].id)

#ORDER 37
order_37 = Order.create(payment: "{'stub','stripe'}", created_at: 11.days.ago, user_id: user_17.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_9.price_cents, total_cents: 200)
OrderItem.create(price: product_9.price_cents, order_id: order_37.id, product_id: product_9.id, quantity: 1, size_id: product_9.sizes[0].id)

#ORDER 38
order_38 = Order.create(payment: "{'stub','stripe'}", created_at: 11.days.ago, user_id: user_17.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_10.price_cents, total_cents: 200)
OrderItem.create(price: product_10.price_cents, order_id: order_38.id, product_id: product_10.id, quantity: 1, size_id: product_10.sizes[0].id)

#ORDER 39
order_39 = Order.create(payment: "{'stub','stripe'}", created_at: 8.days.ago, user_id: user_18.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents, total_cents: 400)
OrderItem.create(price: product_11.price_cents, order_id: order_39.id, product_id: product_11.id, quantity: 1, size_id: product_11.sizes[0].id)

#ORDER 40
order_40 = Order.create(payment: "{'stub','stripe'}", created_at: 3.days.ago, user_id: user_18.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_12.price_cents, total_cents: 400)
OrderItem.create(price: product_12.price_cents, order_id: order_40.id, product_id: product_12.id, quantity: 1, size_id: product_13.sizes[2].id)

#ORDER 41
order_41 = Order.create(payment: "{'stub','stripe'}", created_at: 3.days.ago, user_id: user_18.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_13.price_cents, total_cents: 400)
OrderItem.create(price: product_13.price_cents, order_id: order_41.id, product_id: product_13.id, quantity: 1, size_id: product_13.sizes[0].id)

puts "Orders created"


ShippingAddress.create(
	user_id: user_2.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)


ShippingAddress.create(
	user_id: user_3.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)

ShippingAddress.create(
	user_id: user_4.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)

ShippingAddress.create(
	user_id: user_5.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)

ShippingAddress.create(
	user_id: user_6.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)

ShippingAddress.create(
	user_id: user_7.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)


ShippingAddress.create(
	user_id: user_8.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)

ShippingAddress.create(
	user_id: user_9.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)

ShippingAddress.create(
	user_id: user_10.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)

ShippingAddress.create(
	user_id: user_11.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)

ShippingAddress.create(
	user_id: user_12.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)

ShippingAddress.create(
	user_id: user_13.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)


ShippingAddress.create(
	user_id: user_14.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)


ShippingAddress.create(
	user_id: user_15.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)



ShippingAddress.create(
	user_id: user_16.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)



ShippingAddress.create(
	user_id: user_17.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)



ShippingAddress.create(
	user_id: user_18.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)


ShippingAddress.create(
	user_id: user_19.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)

ShippingAddress.create(
	user_id: user_20.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
)

BillingAddress.create(
	user_id: user_2.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)


BillingAddress.create(
	user_id: user_3.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

BillingAddress.create(
	user_id: user_4.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

BillingAddress.create(
	user_id: user_5.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

BillingAddress.create(
	user_id: user_6.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

BillingAddress.create(
	user_id: user_7.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)


BillingAddress.create(
	user_id: user_8.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

BillingAddress.create(
	user_id: user_9.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

BillingAddress.create(
	user_id: user_10.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

BillingAddress.create(
	user_id: user_11.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

BillingAddress.create(
	user_id: user_12.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

BillingAddress.create(
	user_id: user_13.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

BillingAddress.create(
	user_id: user_14.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

BillingAddress.create(
	user_id: user_15.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

BillingAddress.create(
	user_id: user_16.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)
puts "Shipping and Billing addresses created"
