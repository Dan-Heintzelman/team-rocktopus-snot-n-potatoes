require 'uri'
require 'net/http'
require 'imdb'
require 'json'

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'

  # MySQL and PostgreSQL
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")

  # SQLite
  # ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
end

  User.create!(username: 'dan', password: 'dan', email: 'dan@dan.com')
  User.create!(username: 'Penelope', password: 'pen', email: 'pen@pen.com')
  User.create!(username: 'user', password: 'password', email: 'user@user.com')

  all_array = Imdb::Top250.new.movies
  movies = []

  all_array.each_with_index do |movie, index|
    if index.odd?
      title = movie.title.gsub(/([\d]+[.])/, '').strip!
      title = title.gsub(/([\s]{1})/, '+')
      movies << title
    end
  end
json_array = []

movies.each do |movie|
  if movie == "Sunset+Blvd."
    movie = "Sunset+Boulevard"
  elsif movie == "Sunrise"
    movie = "Before+Sunrise"
  elsif movie == "The+Wages+of+Fear" || movie == "The+Battle+of+Algiers" || movie == "Yip+Man"
  else
    uri = URI.parse(URI.escape("https://api.themoviedb.org/3/search/movie?query=#{movie}&api_key=#{ENV["API_KEY"]}"))
    response = Net::HTTP.get(uri)
    json_array << response

    response = JSON.parse(response)
    tmdb_id = response["results"][0]['id']
    sleep(0.5)
    uri = URI.parse("https://api.themoviedb.org/3/movie/#{tmdb_id}?api_key=#{ENV["API_KEY"]}")
    response = JSON.parse(Net::HTTP.get(uri))
    Movie.create!(title: response['title'], photo_path: response['poster_path'], tagline: response['tagline'], overview: response['overview'], genre: response['genres'][0]['name'], release_date: response['release_date'], runtime: response['runtime'])
  p response['title']
  end
#add favorite seeds
end

  20.times { Review.create(user: User.first, movie: Movie.all.sample, rating: rand(10), comment: 'THIS IS AWESOME') }
  10.times { Favorite.create(user: User.first, movie: Movie.all.sample) }

  40.times { User.create(username: Faker::Name.first_name, password:'password', email: Faker::Internet.email) }
  1000.times { Review.create(user: User.all.sample, movie: Movie.all.sample, rating: rand(10), comment: Faker::Lorem.paragraph) }
  1000.times { Vote.create(user: User.all.sample, review: Review.all.sample, helpful: [true, false].sample)}

  1000.times { Favorite.create(user:User.all.sample, movie: Movie.all.sample) }
