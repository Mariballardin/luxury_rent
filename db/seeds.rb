# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  Product.create(
    category: Faker::Blood.type,
    price: Faker::Commerce.price(range: 10..1000),
    condition: Faker::Emotion.adjective,
    description: Faker::Lorem.sentence(word_count: 8),
    image: Faker::Placeholdit.image
  )
end
