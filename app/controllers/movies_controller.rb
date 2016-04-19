class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[movie_params])
  end

  private
  def movie_params
    params.require(:movies).permit(:title)
  end
end
