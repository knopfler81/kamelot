# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

nelly = User.create(first_name: "Nelly", last_name: "Duclos",admin: true, email: "nelly@example.com", password: "password", password_confirmation: "password")

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
