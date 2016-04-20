require 'uri'
require 'net/http'
require 'imdb'
require 'json'

def dude
  puts "****** yooooooooo ********"
end

def add_one_movie(imdb_id)
  i = Imdb::Movie.new(imdb_id)

  uri = URI.parse(URI.escape("https://api.themoviedb.org/3/search/movie?query=#{i.title}&api_key=#{API_KEY}"))
    response = Net::HTTP.get(uri)
    json_array << response

    response = JSON.parse(response)
    tmdb_id = response["results"][0]['id']
    sleep(0.5)
    uri = URI.parse("https://api.themoviedb.org/3/movie/#{tmdb_id}?api_key=#{API_KEY}")
    response = JSON.parse(Net::HTTP.get(uri))
    Movie.create!(title: response['title'], photo_path: response['poster_path'], tagline: response['tagline'], overview: response['overview'], genre: response['genres'][0]['name'], release_date: response['release_date'], runtime: response['runtime'])
  p response['title']
end

User.create!(username: 'dan', password: 'dan', email: 'dan@dan.com')

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
    uri = URI.parse(URI.escape("https://api.themoviedb.org/3/search/movie?query=#{movie}&api_key=#{API_KEY}"))
    response = Net::HTTP.get(uri)
    json_array << response

    response = JSON.parse(response)
    tmdb_id = response["results"][0]['id']
    sleep(0.5)
    uri = URI.parse("https://api.themoviedb.org/3/movie/#{tmdb_id}?api_key=#{API_KEY}")
    response = JSON.parse(Net::HTTP.get(uri))
    Movie.create!(title: response['title'], photo_path: response['poster_path'], tagline: response['tagline'], overview: response['overview'], genre: response['genres'][0]['name'], release_date: response['release_date'], runtime: response['runtime'])
  p response['title']
  end

20.times { User.create(username: Faker::Name.first_name, password:'password', email: Faker::Internet.email) }
1500.times { Review.create(user: User.all.sample, movie: Movie.all.sample, rating: rand(10), comment: Faker::Lorem.paragraph) }
100.times { Vote.create(user: User.all.sample, review: Review.all.sample, helpful: [true, false].sample)}

500.times { Favorite.create(user:User.all.sample, movie: Movie.all.sample)}

#add favorite seeds
end

