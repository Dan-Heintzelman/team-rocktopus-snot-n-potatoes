class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @featured_movies = @movies.sample(2)
    @trending_movies = @movies.sample(4)
    @top_movies = @movies.sample(4)
    @random_movies = @movies.sample(4)
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private
  def movie_params
    params.require(:movies).permit(:title)
  end
end
