# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times { Movie.create!(title: Faker::Name.title) }


User.create!(username: 'dan', password: 'dan', email: 'dan@dan.com')

20.times { User.create(username: Faker::Name.first_name, password:'password', email: Faker::Internet.email) }
100.times { Review.create(user: User.all.sample, movie: Movie.all.sample, rating: rand(10)) }
100.times { Vote.create(user: User.all.sample, review: Review.all.sample, helpful: [true, false].sample)}
