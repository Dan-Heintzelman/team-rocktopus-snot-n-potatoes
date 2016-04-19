class MoviesController < ApplicationController
  def index

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
