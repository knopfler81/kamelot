Category.destroy_all
Order.destroy_all
Product.destroy_all
User.where(admin: false).destroy_all

puts "Seeds cleaned"

nelly = User.create(admin: true, email: "nelly@example.com", password: "password", password_confirmation: "password")

user_1 = User.create(
	admin: false,
	email: "guest1@example.com",
	password: "password",
	password_confirmation: "password",
)

user_2 = User.create(
	admin: false,
	email: "guest2@example.com",
	password: "password",
	password_confirmation: "password",
)

user_3 = User.create(
	admin: false,
	email: "guest3@example.com",
	password: "password",
	password_confirmation: "password",
)
user_4 = User.create(
	admin: false,
	email: "guest4@example.com",
	password: "password",
	password_confirmation: "password",
)
user_5 = User.create(
	admin: false,
	email: "guest5@example.com",
	password: "password",
	password_confirmation: "password",
)
user_6 = User.create(
	admin: false,
	email: "guest6example.com",
	password: "password",
	password_confirmation: "password",
)

user_7 = User.create(
	admin: false,
	email: "guest7@example.com",
	password: "password",
	password_confirmation: "password",
)

user_8 = User.create(
	admin: false,
	email: "guest8@example.com",
	password: "password",
	password_confirmation: "password",
)

user_9 = User.create(
	admin: false,
	email: "guest9@example.com",
	password: "password",
	password_confirmation: "password",
)
user_10 = User.create(
	admin: false,
	email: "guest10@example.com",
	password: "password",
	password_confirmation: "password",
)
user_11 = User.create(
	admin: false,
	email: "guest11@example.com",
	password: "password",
	password_confirmation: "password",
)
user_12 = User.create(
	admin: false,
	email: "guest12example.com",
	password: "password",
	password_confirmation: "password",
)

user_13 = User.create(
	admin: false,
	email: "guest13@example.com",
	password: "password",
	password_confirmation: "password",
)

user_14 = User.create(
	admin: false,
	email: "guest14@example.com",
	password: "password",
	password_confirmation: "password",
)

user_15 = User.create(
	admin: false,
	email: "guest15@example.com",
	password: "password",
	password_confirmation: "password",
)
user_16 = User.create(
	admin: false,
	email: "guest16@example.com",
	password: "password",
	password_confirmation: "password",
)
user_17 = User.create(
	admin: false,
	email: "guest17@example.com",
	password: "password",
	password_confirmation: "password",
)
user_18 = User.create(
	admin: false,
	email: "guest18example.com",
	password: "password",
	password_confirmation: "password",
)

user_19 = User.create(
	admin: false,
	email: "guest19@example.com",
	password: "password",
	password_confirmation: "password",
)

user_20 = User.create(
	admin: false,
	email: "guest20example.com",
	password: "password",
	password_confirmation: "password",
)

puts "Users & admin created"

pulls 			= Category.create(title: "Pulls")
pantalons 	= Category.create(title: "Pantalons")
tshirt 			= Category.create(title: "Tshirts")
accessoires = Category.create(title: "Accessoires")
chemises 		= Category.create(title: "Chemises")

puts "Categories created"


product_1 = Product.create!(
	brand: "Side Park",
	category_id: pulls.id,
	user_id: nelly.id,
	price_cents: 30,
	color: "Noir",
	title: "Pull Noir",
	description: "Pull très chaud en laine blablablabalbla",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_4.jpg"))
	],
)


product_2 = Product.create(
	brand: "Side Park",
	category_id: pulls.id,
	user_id: nelly.id,
	price_cents: 40,
	color: "Blanc",
	title: "Pull Blanc",
	description: "Pull très chaud en laine blablablabalbla",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_blanc_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_blanc_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_blanc_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_blanc_4.jpg"))
	],
)


product_3 = Product.create(
	brand: "Side Park",
	category_id: pulls.id,
	user_id: nelly.id,
	price_cents: 45,
	color: "Rouge",
	title: "Pull Rouge",
	description: "Pull très chaud en laine blablablabalbla",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_rouge_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_rouge_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_rouge_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_rouge_4.jpg"))
	],
)


product_4 = Product.create(
	brand: "Side Park",
	category_id: pantalons.id,
	user_id: nelly.id,
	price_cents: 49,
	color: "Jaune",
	title: "Pantalon Jaune",
	description: "Pantalon blablablabalbla",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/pantalon_jaune_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pantalon_jaune_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pantalon_jaune_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pantalon_jaune_4.jpg"))
	],
)


product_5 = Product.create(
	brand: "Side Park",
	category_id: pantalons.id,
	user_id: nelly.id,
	price_cents: 60,
	color: "Gris",
	title: "Jean Gris",
	description: "Paalablalntalon blab",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_gris_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_gris_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_gris_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_gris_4.jpg"))
	],
)


product_6 = Product.create(
	brand: "Side Park",
	category_id: pantalons.id,
	user_id: nelly.id,
	price_cents: 20,
	color: "Bleu",
	title: "Jean Bleu",
	description: "Paalablalntalon blab",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_bleu_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_bleu_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_bleu_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_bleu_4.jpg"))
	],
)

product_7 = Product.create!(
	brand: "Side Park",
	category_id: pulls.id,
	user_id: nelly.id,
	price_cents: 45,
	color: "Noir",
	title: "Pull Noir",
	description: "Pull très chaud en laine blablablabalbla",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_noir_4.jpg"))
	],
)


product_8 = Product.create(
	brand: "Side Park",
	category_id: pulls.id,
	user_id: nelly.id,
	price_cents: 30,
	color: "Blanc",
	title: "Pull Blanc",
	description: "Pull très chaud en laine blablablabalbla",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_blanc_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_blanc_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_blanc_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_blanc_4.jpg"))
	],
)



product_9 = Product.create(
	brand: "Side Park",
	category_id: pulls.id,
	user_id: nelly.id,
	price_cents: 70,
	color: "Rouge",
	title: "Pull Rouge",
	description: "Pull très chaud en laine blablablabalbla",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_rouge_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_rouge_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_rouge_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pull_rouge_4.jpg"))
	],	
)


product_10= Product.create(
	brand: "Side Park",
	category_id: pantalons.id,
	user_id: nelly.id,
	price_cents: 39,
	color: "Jaune",
	title: "Pantalon Jaune",
	description: "Pantalon blablablabalbla",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/pantalon_jaune_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pantalon_jaune_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pantalon_jaune_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/pantalon_jaune_4.jpg"))
	],
)


product_11 = Product.create(
	brand: "Side Park",
	category_id: pantalons.id,
	user_id: nelly.id,
	price_cents: 45,
	color: "Gris",
	title: "Jean Gris",
	description: "Paalablalntalon blab",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_gris_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_gris_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_gris_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_gris_4.jpg"))
	],
)


product_12 = Product.create(
	brand: "Side Park",
	category_id: pantalons.id,
	user_id: nelly.id,
	price_cents: 30,
	color: "Bleu",
	title: "Jean Bleu",
	description: "Paalablalntalon blab",
	attachments:[
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_bleu_3.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_bleu_1.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_bleu_2.jpg")),
		File.open(File.join(Rails.root,"app/assets/images/seeds/jean_bleu_4.jpg"))
	],
)

puts "Products Created"

size_1 = Size.create(size_name: "S", quantity: 10, product_id: product_1.id)
size_2 = Size.create(size_name: "M", quantity: 10, product_id: product_1.id)
size_3 = Size.create(size_name: "L", quantity: 10, product_id: product_1.id)
size_4 = Size.create(size_name: "XL", quantity: 10, product_id: product_1.id)

size_5 = Size.create(size_name: "S", quantity: 10, product_id: product_2.id)
size_6 = Size.create(size_name: "M", quantity: 10, product_id: product_2.id)
size_7 = Size.create(size_name: "L", quantity: 10, product_id: product_2.id)
size_8 = Size.create(size_name: "XL", quantity: 10, product_id: product_2.id)

size_9 = Size.create(size_name: "S", quantity: 10, product_id: product_3.id)
size_10 = Size.create(size_name: "M", quantity: 10, product_id: product_3.id)
size_12 = Size.create(size_name: "L", quantity: 10, product_id: product_3.id)
size_13 = Size.create(size_name: "XL", quantity: 10, product_id: product_3.id)

size_14 = Size.create(size_name: "S", quantity: 10, product_id: product_4.id)
size_15 = Size.create(size_name: "M", quantity: 10, product_id: product_4.id)
size_16 = Size.create(size_name: "L", quantity: 10, product_id: product_4.id)
size_17 = Size.create(size_name: "XL", quantity: 10, product_id: product_4.id)

size_18 = Size.create(size_name: "S", quantity: 10, product_id: product_5.id)
size_19 = Size.create(size_name: "M", quantity: 10, product_id: product_5.id)
size_20 = Size.create(size_name: "L", quantity: 10, product_id: product_5.id)
size_21 = Size.create(size_name: "XL", quantity: 10, product_id: product_5.id)

size_22 = Size.create(size_name: "S", quantity: 10, product_id: product_6.id)
size_23 = Size.create(size_name: "M", quantity: 10, product_id: product_6.id)
size_24 = Size.create(size_name: "L", quantity: 10, product_id: product_6.id)
size_25 = Size.create(size_name: "XL", quantity: 10, product_id: product_6.id)

size_26 = Size.create(size_name: "S", quantity: 10, product_id: product_7.id)
size_27 = Size.create(size_name: "M", quantity: 10, product_id: product_7.id)
size_28 = Size.create(size_name: "L", quantity: 10, product_id: product_7.id)
size_29 = Size.create(size_name: "XL", quantity: 10, product_id: product_7.id)

size_30 = Size.create(size_name: "S", quantity: 10, product_id: product_8.id)
size_31 = Size.create(size_name: "M", quantity: 10, product_id: product_8.id)
size_34 = Size.create(size_name: "L", quantity: 10, product_id: product_8.id)
size_35 = Size.create(size_name: "XL", quantity: 10, product_id: product_8.id)

size_36 = Size.create(size_name: "S", quantity: 10, product_id: product_9.id)
size_37 = Size.create(size_name: "M", quantity: 10, product_id: product_9.id)
size_38 = Size.create(size_name: "L", quantity: 10, product_id: product_9.id)
size_39 = Size.create(size_name: "XL", quantity: 10, product_id: product_9.id)

size_40 = Size.create(size_name: "S", quantity: 10, product_id: product_10.id)
size_41 = Size.create(size_name: "M", quantity: 10, product_id: product_10.id)
size_42 = Size.create(size_name: "L", quantity: 10, product_id: product_10.id)
size_42 = Size.create(size_name: "XL", quantity: 10, product_id: product_9.id)

size_43 = Size.create(size_name: "S", quantity: 10, product_id: product_11.id)
size_44 = Size.create(size_name: "M", quantity: 10, product_id: product_11.id)
size_45 = Size.create(size_name: "L", quantity: 10, product_id: product_11.id)
size_46 = Size.create(size_name: "XL", quantity: 10, product_id: product_11.id)


puts "Sizes created"

#ORDER 1
order_1  = Order.create(created_at: 16.days.ago, user_id: user_2.id,  token: SecureRandom.hex(8), status: 3, shipping_fees_cents: 5, sub_total_cents: [product_1.price_cents + product_1.price_cents].sum , total_cents: 200)
OrderItem.create(price: product_1.price_cents, order_id: order_1.id, product_id: product_1.id, quantity: 1, size_id: size_1.id)
OrderItem.create(price: product_2.price_cents, order_id: order_1.id, product_id: product_1.id, quantity: 1, size_id: size_4.id)

#ORDER 2
order_2  = Order.create(created_at: 15.days.ago, user_id: user_2.id,  token: SecureRandom.hex(8), status: 3, shipping_fees_cents: 5, sub_total_cents: [product_1.price_cents + product_1.price_cents].sum , total_cents: 200)
OrderItem.create(price: product_1.price_cents, order_id: order_2.id, product_id: product_1.id, quantity: 1, size_id: size_1.id)
OrderItem.create(price: product_2.price_cents, order_id: order_2.id, product_id: product_1.id, quantity: 1, size_id: size_4.id)

#ORDER 3
order_3  = Order.create(created_at: 15.days.ago, user_id: user_3.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: [product_1.price_cents * 2 + product_2.price_cents * 2].sum , total_cents: 200)
OrderItem.create(price: product_1.price_cents, order_id: order_3.id, product_id: product_1.id, quantity: 2, size_id: size_7.id)
OrderItem.create(price: product_1.price_cents, order_id: order_3.id, product_id: product_2.id, quantity: 2, size_id: size_8.id)

#ORDER 4
order_4  = Order.create(created_at: 11.days.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 4, shipping_fees_cents: 5, sub_total_cents: product_2.price_cents , total_cents: 200)
OrderItem.create(price: product_2.price_cents, order_id: order_4.id, product_id: product_2.id, quantity: 1, size_id: size_5.id)

#ORDER 5
order_5  = Order.create(created_at: 11.days.ago, user_id: user_5.id,  token: SecureRandom.hex(8), status: 5, shipping_fees_cents: 5, sub_total_cents: product_2.price_cents , total_cents: 200)
OrderItem.create(price: product_2.price_cents, order_id: order_5.id, product_id: product_2.id, quantity: 1, size_id: size_8.id)

#ORDER 6
order_6  = Order.create(created_at: 10.days.ago, user_id: user_6.id,  token: SecureRandom.hex(8), status: 3, shipping_fees_cents: 5, sub_total_cents: [product_2.price_cents * 2 + product_3.price_cents + product_3.price_cents].sum , total_cents: 200)
OrderItem.create(price: product_2.price_cents, order_id: order_6.id, product_id: product_2.id, quantity: 2, size_id: size_7.id)
OrderItem.create(price: product_3.price_cents, order_id: order_6.id, product_id: product_3.id, quantity: 1, size_id: size_9.id)
OrderItem.create(price: product_3.price_cents, order_id: order_6.id, product_id: product_3.id, quantity: 1, size_id: size_10.id)

#ORDER 7
order_7  = Order.create(created_at: 10.days.ago, user_id: user_7.id,  token: SecureRandom.hex(8), status: 3, shipping_fees_cents: 5, sub_total_cents: product_3.price_cents , total_cents: 200)
OrderItem.create(price: product_3.price_cents, order_id: order_7.id, product_id: product_3.id, quantity: 1, size_id: size_10.id)

#ORER 8
order_8  = Order.create(created_at: 9.days.ago, user_id: user_8.id,  token: SecureRandom.hex(8), status: 3, shipping_fees_cents: 5, sub_total_cents: product_3.price_cents * 2 , total_cents: 200)
OrderItem.create(price: product_3.price_cents, order_id: order_8.id, product_id: product_3.id, quantity: 1, size_id: size_10.id)
OrderItem.create(price: product_3.price_cents, order_id: order_8.id, product_id: product_3.id, quantity: 2, size_id: size_9.id)

#ORDER 9
order_9  = Order.create(created_at: 8.days.ago, user_id: user_9.id,  token: SecureRandom.hex(8), status: 5, shipping_fees_cents: 5, sub_total_cents: product_4.price_cents , total_cents: 200)
OrderItem.create(price: product_4.price_cents, order_id: order_9.id, product_id: product_4.id, quantity: 1, size_id: size_15.id)

#ORDER 10
order_10 = Order.create(created_at: 8.days.ago, user_id: user_10.id, token: SecureRandom.hex(8), status: 3, shipping_fees_cents: 5, sub_total_cents: product_4.price_cents , total_cents: 200)
OrderItem.create(price: product_4.price_cents, order_id: order_10.id, product_id: product_4.id, quantity: 1, size_id: size_16.id)

#ORDER 11 
order_11 = Order.create(created_at: 6.days.ago, user_id: user_11.id, token: SecureRandom.hex(8), status: 4, shipping_fees_cents: 5, sub_total_cents: product_5.price_cents * 3 , total_cents: 200)
OrderItem.create(price: product_5.price_cents, order_id: order_11.id, product_id: product_5.id, quantity: 2, size_id: size_18.id)
OrderItem.create(price: product_5.price_cents, order_id: order_11.id, product_id: product_5.id, quantity: 1, size_id: size_20.id)

#ORDER 12
order_12 = Order.create(created_at: 5.days.ago, user_id: user_12.id, token: SecureRandom.hex(8), status: 3, shipping_fees_cents: 5, sub_total_cents: product_7.price_cents, total_cents: 200)
OrderItem.create(price: product_7.price_cents, order_id: order_12.id, product_id: product_7.id, quantity: 1, size_id: size_28.id)

#ORDER 13
order_13 = Order.create(created_at: 5.days.ago, user_id: user_13.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_6.price_cents, total_cents: 200)
OrderItem.create(price: product_6.price_cents, order_id: order_13.id, product_id: product_6.id, quantity: 1, size_id: size_22.id)

#ORDER 14
order_14 = Order.create(created_at: 5.days.ago, user_id: user_14.id, token: SecureRandom.hex(8), status: 2, shipping_fees_cents: 5, sub_total_cents: product_6.price_cents, total_cents: 200)
OrderItem.create(price: product_6.price_cents, order_id: order_14.id, product_id: product_6.id, quantity: 1, size_id: size_22.id)

#ORDER 15
order_15 = Order.create(created_at: 3.days.ago, user_id: user_15.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_6.price_cents * 3 , total_cents: 200)
OrderItem.create(price: product_8.price_cents, order_id: order_15.id, product_id: product_8.id, quantity: 3, size_id: size_30.id)

#ORDER 16
order_16 = Order.create(created_at: 3.days.ago, user_id: user_16.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_8.price_cents * 2 , total_cents: 200)
OrderItem.create(price: product_8.price_cents, order_id: order_16.id, product_id: product_8.id, quantity: 2, size_id: size_1.id)

#ORDER 17
order_17 = Order.create(created_at: 2.days.ago, user_id: user_17.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_9.price_cents, total_cents: 200)
OrderItem.create(price: product_9.price_cents, order_id: order_17.id, product_id: product_9.id, quantity: 1, size_id: size_36.id)

#ORDER 18
order_18 = Order.create(created_at: 1.days.ago, user_id: user_17.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_10.price_cents, total_cents: 200)
OrderItem.create(price: product_10.price_cents, order_id: order_18.id, product_id: product_10.id, quantity: 1, size_id: size_40.id)

#ORDER 19
order_19 = Order.create(created_at: 1.days.ago, user_id: user_18.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_19.id, product_id: product_11.id, quantity: 1, size_id: size_43.id)

#ORDER 20
order_20 = Order.create(created_at: Time.now, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_20.id, product_id: product_11.id, quantity: 3, size_id: size_44.id)

#ORDER 21
order_21 = Order.create(created_at: 1.month.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_21.id, product_id: product_11.id, quantity: 3, size_id: size_44.id)

#ORDER 22
order_22 = Order.create(created_at: 1.month.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_20.id, product_id: product_11.id, quantity: 3, size_id: size_44.id)

#ORDER 23
order_23 = Order.create(created_at: 1.month.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_23.id, product_id: product_11.id, quantity: 3, size_id: size_44.id)

#ORDER 24
order_24 = Order.create(created_at: 1.month.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_24.id, product_id: product_11.id, quantity: 3, size_id: size_44.id)

#ORDER 25
order_25 = Order.create(created_at: 1.month.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_25.id, product_id: product_11.id, quantity: 3, size_id: size_44.id)

#ORDER 26
order_26 = Order.create(created_at: 1.month.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_26.id, product_id: product_11.id, quantity: 3, size_id: size_44.id)


#ORDER 27
order_27 = Order.create(created_at: 2.days.ago, user_id: user_17.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_9.price_cents, total_cents: 200)
OrderItem.create(price: product_9.price_cents, order_id: order_27.id, product_id: product_9.id, quantity: 1, size_id: size_36.id)

#ORDER 28
order_28 = Order.create(created_at: 1.days.ago, user_id: user_17.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_10.price_cents, total_cents: 200)
OrderItem.create(price: product_10.price_cents, order_id: order_28.id, product_id: product_10.id, quantity: 1, size_id: size_40.id)

#ORDER 29
order_29 = Order.create(created_at: 1.days.ago, user_id: user_18.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_29.id, product_id: product_11.id, quantity: 1, size_id: size_43.id)

#ORDER 30
order_30 = Order.create(created_at: Time.now, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_30.id, product_id: product_11.id, quantity: 3, size_id: size_44.id)

#ORDER 31
order_31 = Order.create(created_at: 1.month.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_31.id, product_id: product_11.id, quantity: 3, size_id: size_44.id)

#ORDER 32
order_32 = Order.create(created_at: 1.month.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_32.id, product_id: product_11.id, quantity: 3, size_id: size_44.id)

#ORDER 33
order_33 = Order.create(created_at: 1.month.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_33.id, product_id: product_11.id, quantity: 3, size_id: size_44.id)

#ORDER 34
order_34 = Order.create(created_at: 1.month.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_34.id, product_id: product_11.id, quantity: 3, size_id: size_44.id)

#ORDER 35
order_35 = Order.create(created_at: 2.months.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_35.id, product_id: product_11.id, quantity: 3, size_id: size_44.id)

#ORDER 36
order_36 = Order.create(created_at: 2.months.ago, user_id: user_4.id,  token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents * 3, total_cents: 200)
OrderItem.create(price: product_11.price_cents, order_id: order_36.id, product_id: product_11.id, quantity: 3, size_id: size_44.id)

#ORDER 37
order_37 = Order.create(created_at: 2.months.ago, user_id: user_17.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_9.price_cents, total_cents: 200)
OrderItem.create(price: product_9.price_cents, order_id: order_37.id, product_id: product_9.id, quantity: 1, size_id: size_36.id)

#ORDER 38
order_38 = Order.create(created_at: 2.months.ago, user_id: user_17.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_10.price_cents, total_cents: 200)
OrderItem.create(price: product_10.price_cents, order_id: order_38.id, product_id: product_10.id, quantity: 1, size_id: size_40.id)

#ORDER 39
order_39 = Order.create(created_at: 2.months.ago, user_id: user_18.id, token: SecureRandom.hex(8), status: 1, shipping_fees_cents: 5, sub_total_cents: product_11.price_cents, total_cents: 400)
OrderItem.create(price: product_11.price_cents, order_id: order_39.id, product_id: product_11.id, quantity: 1, size_id: size_43.id)

puts "Orders created"


ShippingAddress.create(
	user_id: user_2.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)


ShippingAddress.create(
	user_id: user_3.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

ShippingAddress.create(
	user_id: user_4.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

ShippingAddress.create(
	user_id: user_5.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

ShippingAddress.create(
	user_id: user_6.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)
ShippingAddress.create(
	user_id: user_7.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)


ShippingAddress.create(
	user_id: user_8.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

ShippingAddress.create(
	user_id: user_9.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

ShippingAddress.create(
	user_id: user_10.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

ShippingAddress.create(
	user_id: user_11.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

ShippingAddress.create(
	user_id: user_12.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

ShippingAddress.create(
	user_id: user_13.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

ShippingAddress.create(
	user_id: user_14.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

ShippingAddress.create(
	user_id: user_15.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)
ShippingAddress.create(
	user_id: user_16.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

ShippingAddress.create(
	user_id: user_17.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

ShippingAddress.create(
	user_id: user_18.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

ShippingAddress.create(
	user_id: user_19.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

ShippingAddress.create(
	user_id: user_20.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
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



BillingAddress.create(
	user_id: user_17.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)



BillingAddress.create(
	user_id: user_18.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)


BillingAddress.create(
	user_id: user_19.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)

BillingAddress.create(
	user_id: user_20.id,
	first_name: Faker::Name.first_name,
	last_name: Faker::Name.last_name,
	address_1: Faker::Address.street_name,
	zipcode: Faker::Address.zip_code,
	city: Faker::Address.city,
	phone: Faker::PhoneNumber.phone_number
)


puts "Shipping and Billing addresses created"


