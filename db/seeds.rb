require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'cleaning database'

Product.destroy_all

puts 'creating products'

10.times do
  product = Product.new(
    user_id: 1,
    category: Faker::Blood.type,
    price: Faker::Commerce.price(range: 10..1000),
    condition: Faker::Emotion.adjective,
    description: Faker::Lorem.sentence(word_count: 8),
  )
  file = URI.open("https://source.unsplash.com/featured/?clothes&#{rand}")
  product.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  product.save!
end

puts 'Finished!!'
