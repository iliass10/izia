# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Result.destroy_all
Appointment.destroy_all
Metric.destroy_all
Test.destroy_all
User.destroy_all
puts "------> Create users"
thomas = User.create!(email: "thomas@lewagon.org", password: "123456", password_confirmation: "123456")
adem = User.create!(email: "adem@lewagon.org", password: "123456", password_confirmation: "123456")
illias = User.create!(email: "illiass@lewagon.org", password: "123456", password_confirmation: "123456")
bruno = User.create!(email: "bruno@lewagon.org", password: "123456", password_confirmation: "123456")
puts "------> Create tests"
blood = Test.create!(name: "Test sanguin", description: "Soyez créatif")
puts "------> Define metrics"
hb = Metric.create!(name: "Taux de hemoglobine", test: blood)
calcium = Metric.create!(name: "Taux de calcium", test: blood)
iron = Metric.create!(name: "Taux de fer", test: blood)
puts "------> Create some appointments... "
a1 = Appointment.create!(user: thomas, test:blood, datetime: Time.zone.now)
a2 = Appointment.create!(user: adem, test:blood, datetime: Time.zone.yesterday)
a3 = Appointment.create!(user: illias, test:blood, datetime: Time.zone.now)
puts "------> Let's set the results "
Result.create(appointment:a1, metric: hb, value: 98)
Result.create(appointment:a1, metric: iron, value: 130)
Result.create(appointment:a1, metric: calcium, value: 40)
Result.create(appointment:a2, metric: hb, value: 98)
Result.create(appointment:a2, metric: iron, value: 130)
Result.create(appointment:a2, metric: calcium, value: 40)
Result.create(appointment:a3, metric: hb, value: 98)
Result.create(appointment:a3, metric: iron, value: 130)
Result.create(appointment:a3, metric: calcium, value: 40)





