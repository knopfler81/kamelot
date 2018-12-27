# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

nelly = User.create(admin: true, email: "nelly@example.com", password: "password", password_confirmation: "password")

n = 0
5.times do 
	User.create(
		admin: false,
		email: "guest#{n += 1}@example.com",
		password: "password",
		password_confirmation: "password",
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		address_1: Faker::Address.street_name,
		zipcode: Faker::Address.zip_code,
		city: Faker::Address.city,
		phone: Faker::PhoneNumber.phone_number
	)
end

pulls 			= Category.create(title: "Pulls")
pantalons 	= Category.create(title: "Pantalons")
tshirt 			= Category.create(title: "Tshirts")
accessoires = Category.create(title: "Accessoires")
chemises 		= Category.create(title: "Chemises")


# product_1 = Product.create(
# 	user_id: nelly.id,
# 	price: 20,
# 	category_id: accessoires.id,
# 	title: "Ceinture",
# 	description: "Cuir",
# 	color: "Marron",
# 	size: "L",
# 	quantity: 5,
# )

# product_2 = Product.create(
# 	user_id: nelly.id,
# 	price: 35,
# 	category_id: chemises.id,
# 	title: "Chemise",
# 	description: "Manches longues",
# 	color: "Noire",
# 	size: "S",
# 	quantity: 5,
# )



# product_3 = Product.create(
# 	user_id: nelly.id,
# 	price: 20,
# 	category_id: pulls.id,
# 	title: "Pull",
# 	description: "Col roulé",
# 	color: "Noir",
# 	size: "S",
# 	quantity: 3,
# )



# product_4 = Product.create(
# 	user_id: nelly.id,
# 	price: 30,
# 	category_id: pantalons.id,
# 	title: "Pantalon",
# 	description: "Jean brut",
# 	color: "bleu",
# 	size: "S",
# 	quantity: 2,
# )

# product_5 = Product.create(
# 	user_id: nelly.id,
# 	price: 90,
# 	category_id: tshirt.id,
# 	title: "Tshirt",
# 	description: "Col V",
# 	color: "Noir",
# 	size: "S",
# 	quantity: 5,
# )

# product_6 = Product.create(
# 	user_id: nelly.id,
# 	price: 70,
# 	category_id: chemises.id,
# 	title: "Chemise",
# 	description: "Manches longues",
# 	color: "Noire",
# 	size: "M",
# 	quantity: 5,
# )

# product_7 = Product.create(
# 	user_id: nelly.id,
# 	price: 80,
# 	category_id: pulls.id,
# 	title: "Pull",
# 	description: "Col roulé",
# 	color: "Noir",
# 	size: "M",
# 	quantity: 3,
# )

# product_8 = Product.create(
# 	user_id: nelly.id,
# 	price: 20,
# 	category_id: pantalons.id,
# 	title: "Pantalon",
# 	description: "Jean brut",
# 	color: "bleu",
# 	size: "M",
# 	quantity: 2,
# )

# product_9= Product.create(
# 	user_id: nelly.id,
# 	price: 45,
# 	category_id: tshirt.id,
# 	title: "Tshirt",
# 	description: "Col V",
# 	color: "Noir",
# 	size: "M",
# 	quantity: 5,
# )

# product_10 = Product.create(
# 	user_id: nelly.id,
# 	price: 100,
# 	category_id: chemises.id,
# 	title: "Chemise",
# 	description: "Manches longues",
# 	color: "Noire",
# 	size: "L",
# 	quantity: 5,
# )

# product_11 = Product.create(
# 	user_id: nelly.id,
# 	price: 35,
# 	category_id: pulls.id,
# 	title: "Pull",
# 	description: "Col roulé",
# 	color: "Noir",
# 	size: "L",
# 	quantity: 3,
# )

# product_12 = Product.create(
# 	user_id: nelly.id,
# 	price: 25,
# 	category_id: pantalons.id,
# 	title: "Pantalon",
# 	description: "Jean brut",
# 	color: "bleu",
# 	size: "L",
# 	quantity: 2,
# )

# product_13 = Product.create(
# 	user_id: nelly.id,
# 	price: 80,
# 	category_id: tshirt.id,
# 	title: "Tshirt",
# 	description: "Col V",
# 	color: "Noir",
# 	size: "L",
# 	quantity: 5,
# )

# product_14 = Product.create(
# 	user_id: nelly.id,
# 	price: 50,
# 	category_id: chemises.id,
# 	title: "Chemise",
# 	description: "Manches longues",
# 	color: "Noire",
# 	size: "XL",
# 	quantity: 5,
# )

# product_15 = Product.create(
# 	user_id: nelly.id,
# 	price: 20,
# 	category_id: pulls.id,
# 	title: "Pull",
# 	description: "Col roulé",
# 	color: "Noir",
# 	size: "XL",
# 	quantity: 3,
# )

# product_16 = Product.create(
# 	user_id: nelly.id,
# 	price: 30,
# 	category_id: pantalons.id,
# 	title: "Pantalon",
# 	description: "Jean brut",
# 	color: "bleu",
# 	size: "XL",
# 	quantity: 2,
# )

# product_17 = Product.create(
# 	user_id: nelly.id,
# 	price: 10,
# 	category_id: tshirt.id,
# 	title: "Tshirt",
# 	description: "Col V",
# 	color: "Noir",
# 	size: "XL",
# 	quantity: 5,
# )
