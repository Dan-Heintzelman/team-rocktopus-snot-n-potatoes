class MoviesController < ApplicationController
  include MoviesHelper
  def index
    @movies = Movie.all
    @trending = Movie.trending
    @featured = Movie.featured
    rando1 = random_genre
    rando2 = random_genre
    @genre = rando1
    @genre2 = rando2
    @random_genre1 = Movie.categorize(rando1)
    @random_genre2 = Movie.categorize(rando2)
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def show_by_genre
    genre = params["genre"]
    puts genre
    @movies = Movie.categorize(genre.capitalize)
  end

  private
  def movie_params
    params.require(:movies).permit(:title)
  end

end
