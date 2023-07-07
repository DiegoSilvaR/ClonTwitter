# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
20.times do
  tweet = Tweet.create(description: Faker::Lorem.sentence, userName: Faker::Internet.username)
  image_path = Rails.root.join('app', 'assets', 'images', "profile#{rand(1..12)}.png")
  tweet.profile_image.attach(io: File.open(image_path), filename: "profile#{rand(1..12)}.png")
end


