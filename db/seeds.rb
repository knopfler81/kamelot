# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Order.destroy_all
Product.destroy_all
User.destroy_all

puts "Users destroyed"

 nelly = User.create(admin: true, email: "nelly@example.com", password: "password", password_confirmation: "password")

puts "Admin created"

n = 0
5.times do 
	User.create(
		admin: false,
		email: "guest#{n += 1}@example.com",
		password: "password",
		password_confirmation: "password",

	)
	puts "Creating user"
end

pulls 			= Category.create(title: "Pulls")
pantalons 	= Category.create(title: "Pantalons")
tshirt 			= Category.create(title: "Tshirts")
accessoires = Category.create(title: "Accessoires")
chemises 		= Category.create(title: "Chemises")


Product.create!(
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
		
	sizes_attributes: [
		{
		size_name: "S",
		quantity: 3
		},
		{
		size_name: "M",
		quantity: 3
		},
		{
		size_name: "L",
		quantity: 4
		}
	]
)


puts "Product Created"
Product.create(
	brand: "Side Park",
	category_id: pulls.id,
	user_id: nelly.id,
	price_cents: 30,
	color: "Blanc",
	title: "Pull Blanc",
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
		quantity: 3
		},
		{
		size_name: "M",
		quantity: 3
		},
		{
		size_name: "L",
		quantity: 4
		}
	]
)


puts "Product Created"
Product.create(
	brand: "Side Park",
	category_id: pulls.id,
	user_id: nelly.id,
	price_cents: 30,
	color: "Rouge",
	title: "Pull Rouge",
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
		quantity: 3
		},
		{
		size_name: "M",
		quantity: 3
		},
		{
		size_name: "L",
		quantity: 4
		}
	]
)


puts "Product Created"

Product.create(
	brand: "Side Park",
	category_id: pantalons.id,
	user_id: nelly.id,
	price_cents: 30,
	color: "Jaune",
	title: "Pantalon Jaune",
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
		quantity: 3
		},
		{
		size_name: "L",
		quantity: 4
		}
	]
)


puts "Product Created"

Product.create(
	brand: "Side Park",
	category_id: pantalons.id,
	user_id: nelly.id,
	price_cents: 30,
	color: "Gris",
	title: "Jean Gris",
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
		quantity: 3
		},
		{
		size_name: "M",
		quantity: 3
		},
		{
		size_name: "L",
		quantity: 4
		}
	]
)


puts "Product Created"

Product.create(
	brand: "Side Park",
	category_id: pantalons.id,
	user_id: nelly.id,
	price_cents: 30,
	color: "Bleu",
	title: "Jean Bleu",
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
		quantity: 3
		},
		{
		size_name: "M",
		quantity: 3
		},
		{
		size_name: "L",
		quantity: 4
		}
	]
)

puts "Product Created"