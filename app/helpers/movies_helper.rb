require 'uri'
require 'net/http'
require 'imdb'
require 'json'
require_relative './api.rb'

module MoviesHelper
  def random_genre
    genres = ["Comedy", "Action", "Romance", "Drama", "Horror", "Adventure", "Animation", "Crime", "Fantasy", "Mystery", "Western", "Thriller"]
    genres.sample(1)
  end

  def add_one_movie(imdb_id)
    i = Imdb::Movie.new(imdb_id)

    uri = URI.parse(URI.escape("https://api.themoviedb.org/3/search/movie?query=#{i.title}&api_key=#{API_KEY}"))
      response = Net::HTTP.get(uri)


      response = JSON.parse(response)
      tmdb_id = response["results"][0]['id']
      sleep(0.5)
      uri = URI.parse("https://api.themoviedb.org/3/movie/#{tmdb_id}?api_key=#{API_KEY}")
      response = JSON.parse(Net::HTTP.get(uri))
      Movie.create!(title: response['title'], photo_path: response['poster_path'], tagline: response['tagline'], overview: response['overview'], genre: response['genres'][0]['name'], release_date: response['release_date'], runtime: response['runtime'])
    p response['title']
  end
end
