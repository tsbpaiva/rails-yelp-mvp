# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
Restaurant.destroy_all
Review.destroy_all

20.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    phone_number: Faker::PhoneNumber.phone_number,
    category: %w[chinese italian japanese french belgian].sample,
    address: Faker::Address.street_address
  )
end

i = 1
20.times do
  Review.create(
    content: Faker::Restaurant.review,
    rating: rand(1..5),
    restaurant_id: i
  )
  i += 1
end

15.times do
  Review.create(
    content: Faker::Restaurant.review,
    rating: rand(1..5),
    restaurant_id: rand(1..20)
  )
end
