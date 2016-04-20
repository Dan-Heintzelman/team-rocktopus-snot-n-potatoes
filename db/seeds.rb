require 'uri'
require 'net/http'
require 'imdb'
require 'json'

API_KEY = 'e6a7d7c4dac181db7ea598c2d15343e1'

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
      Movie.create!(title: response['title'], photo_path: response['poster_path'], tagline: response['tagline'], overview: response['overview'], genre: response['genres'][0]['name'], release_date: response['release_date'], runtime: response['runtime'], approved: true)
      p response['title']
    end
  end


