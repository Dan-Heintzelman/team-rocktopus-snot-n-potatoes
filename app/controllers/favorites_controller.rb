class FavoritesController < ApplicationController
  before_action :authenticate!

  def create
    @favorite = Favorite.create(movie_id: params[:movie_id], user: User.find_by(id: params[:user]))
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
  end

  private
  def favorite_params
    params.require(:user).permit(:user, :movie)
  end
end
