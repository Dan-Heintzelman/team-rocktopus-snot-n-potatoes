class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @trending = Movie.trending
    @featured = Movie.featured
    @comedies = Movie.categorize("Comedy")
    @dramas = Movie.categorize("Drama")
    @action = Movie.categorize("Action")
    @chick_flicks = Movie.categorize("Romance")
    @nerdy = Movie.categorize("Sci-Fi")
    @harrah = Movie.categorize("Horror")
  end

  def new
    @movie = Movie.new
  end

  def show
    # @movie = Movie.find(params[:id])
  end


  private
  def movie_params
    params.require(:movies).permit(:title)
  end

end
