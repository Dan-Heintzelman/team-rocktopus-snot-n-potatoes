class MoviesController < ApplicationController
  include MoviesHelper
  before_action :authenticate!, except: [:show_by_genre, :index, :show]
  # before_action :admin, only: [:approve]


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

  def approve
    # puts current_user
    # puts current_user.username
    # if current_user.username == 'Penelope'
      @movies_to_approve = Movie.where(approved: false)
    # else
    #   redirect_to root_path
    # end
  end

  def create
    if request.xhr?
      @movie = Movie.create(params[:movie])
      p params["title"]
      add_one_movie(params["title"])
      render nothing: true
    else

    end
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(approved: params[:approved])
    redirect_to movie_pending_approvals_path
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movie_pending_approvals_path
  end

  private
  def movie_params
    params.require(:movies).permit(:title)
  end

end
