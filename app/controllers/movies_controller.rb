require_relative "./../../db/seeds.rb"

class MoviesController < ApplicationController
  include MoviesHelper
  before_action :authenticate!, except: [:index, :show]


  def index
    @movies = Movie.all
    @highest = Movie.highest_rated
    @trending = Movie.trending
    @featured = Movie.featured
    rando = random_genre
    @genre = rando
    @random_genre1 = Movie.categorize(rando)
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def show_by_genre
    @genre = params["genre"].capitalize
    @movies = Movie.categorize(@genre)
  end

  def create
    add_one_movie(params["imdb_id"])
    redirect_to movies_path
  end

  private
  def movie_params
    params.require(:movies).permit(:title)
  end

end
