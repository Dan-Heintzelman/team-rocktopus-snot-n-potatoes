require 'uri'
require 'net/http'
require 'imdb'
require 'json'

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
  uri = URI.parse(URI.escape("https://api.themoviedb.org/3/search/movie?query=#{movie}&api_key="))
  response = Net::HTTP.get(uri)
  json_array << response

  response = JSON.parse(response)
  tmdb_id = response["results"][0]['id']
  sleep(3)
  uri = URI.parse("https://api.themoviedb.org/3/movie/#{tmdb_id}?api_key=")
  response = JSON.parse(Net::HTTP.get(uri))
  p response['title']
  p response['poster_path']
  p response['genres'][0]['name']
  p response['overview']
  p response['release_date']
  p response['tagline']
  p response['runtime']
end


