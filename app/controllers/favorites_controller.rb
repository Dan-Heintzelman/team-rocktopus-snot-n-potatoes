class FavoritesController < ApplicationController
  before_action :authenticate!

  def create
    @favorite = Favorite.create(movie_id: params[:movie_id], user: User.find_by(id: params[:user]))
    redirect_to movie_path(params[:movie_id])
  end

  def destroy
    @favorite = Favorite.find_by(movie_id: params[:movie_id], user: User.find_by(id: params[:user]))
    @favorite.destroy
    redirect_to movie_path(params[:movie_id])
  end

  private
  def favorite_params
    params.require(:user).permit(:user, :movie)
  end
end
