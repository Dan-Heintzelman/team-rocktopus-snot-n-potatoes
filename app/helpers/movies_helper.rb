require 'uri'
require 'net/http'
require 'imdb'
require 'json'

module MoviesHelper
  def calc_date(release_date)
    date = DateTime.parse(release_date)
    formatted = date.strftime('%b %d, %Y')
  end

  def random_genre
    genres = ["Comedy", "Action", "Romance", "Drama", "Horror", "Adventure", "Animation", "Crime", "Fantasy", "Mystery", "Western", "Thriller"]
    genres.sample(1)
  end

  def add_one_movie(title)
    puts "********" + title + "********"
    uri = URI.parse(URI.escape("https://api.themoviedb.org/3/search/movie?query=#{title}&api_key=e6a7d7c4dac181db7ea598c2d15343e1"))
    p uri
      response = Net::HTTP.get(uri)
      response = JSON.parse(response)
      p response
      if (response["results"][0]['id'])
        tmdb_id = response["results"][0]['id']
        sleep(0.5)
        uri = URI.parse("https://api.themoviedb.org/3/movie/#{tmdb_id}?api_key=e6a7d7c4dac181db7ea598c2d15343e1")
        response = JSON.parse(Net::HTTP.get(uri))

        if response['tagline']
          Movie.create!(title: response['title'], photo_path: response['poster_path'], tagline: response['tagline'], overview: response['overview'], genre: response['genres'][0]['name'], release_date: response['release_date'], runtime: response['runtime'])
            return true
        else
          @errors = ['Valid title, however that is not a movie. Perhaps it is a television show or an indie film that nobody watched.']
        end
      else
        @errors = ['You have entered an invalid title. Please try again.']
      end
    return false
  end
end
