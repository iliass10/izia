# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

Result.destroy_all
Metric.destroy_all
Test.destroy_all
Appointment.destroy_all
User.destroy_all

puts "------> Create users"
thomas = User.create!(email: "thomas@lewagon.org", password: "123456", password_confirmation: "123456")
adem = User.create!(email: "adem@lewagon.org", password: "123456", password_confirmation: "123456")
illias = User.create!(email: "illiass@lewagon.org", password: "123456", password_confirmation: "123456")
bruno = User.create!(email: "bruno@lewagon.org", password: "123456", password_confirmation: "123456")

puts "------> Create tests"
blood = Test.create!(name: "Test sanguin", description: "Un bilan sanguin permet de mesurer votre taux d'hémoglobine, de calcium et de fer.")

puts "------> Define metrics"
glycemie = Metric.create!(name: "Glycémie", test: blood)
cholesterol = Metric.create!(name: "Cholestérol", test: blood)
transaminases = Metric.create!(name: "Transaminases", test: blood)
creatinine_sanguine = Metric.create!(name: "Créatinine sanguine", test: blood)

puts "------> Create some appointments... "
a1 = Appointment.create!(user: thomas, test:blood, datetime: Time.zone.now)
a2 = Appointment.create!(user: thomas, test:blood, datetime: "2019-10-19 10:00")
a3 = Appointment.create!(user: thomas, test:blood, datetime: "2018-07-17 15:23")


puts "------> Let's set the results "
Result.create!(appointment:a1, metric: glycemie, value: 0.7)
Result.create!(appointment:a1, metric: cholesterol, value: 1.5)
Result.create!(appointment:a1, metric: transaminases, value: 60)
Result.create!(appointment:a1, metric: creatinine_sanguine, value: 90)

Result.create!(appointment:a2, metric: glycemie, value: 1)
Result.create!(appointment:a2, metric: cholesterol, value: 2.1)
Result.create!(appointment:a2, metric: transaminases, value: 65)
Result.create!(appointment:a2, metric: creatinine_sanguine, value: 95)

Result.create!(appointment:a3, metric: glycemie, value: 1.2)
Result.create!(appointment:a3, metric: cholesterol, value: 2.2)
Result.create!(appointment:a3, metric: transaminases, value: 70)
Result.create!(appointment:a3, metric: creatinine_sanguine, value: 100)

