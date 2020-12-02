# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "cleaning database"
User.destroy_all

puts "Create a user"
user = User.create!(email: "toto@mail.com", password: "123456", first_name: "toto", last_name: "toto")
puts "done"
