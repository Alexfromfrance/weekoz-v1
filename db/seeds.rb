# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Relationship.destroy_all
Slot.destroy_all
Participation.destroy_all
Course.destroy_all
Company.destroy_all
User.destroy_all


pam = User.create!(first_name: "Pam", last_name: "Pam", phone_number: "0678912345", email: "pam@weekoz.fr", password: "123456", role: "trainer", description: "La meilleure prof de ping pong")
paul = User.create!(first_name: "Paul", last_name: "Dubois", phone_number: "0123456789", email: "pd@gmail.com", password: "123456", role: "student")

Relationship.create!(student: paul, trainer: pam)

pingpong = Course.create!(title: "cours de Ping Pong", address: "Jardin des Tuileries", max_participants: 4, price: 10, course_type: "cours public", prepayment: false, trainer: pam, start: DateTime.new(2020,5,3,4,9,0), end: DateTime.new(2020,5,3,4,10,0))
Participation.create!(student: paul, course: pingpong)
