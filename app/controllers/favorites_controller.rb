class FavoritesController < ApplicationController
  before_action :authenticate!

  def create
    @favorite = Favorite.create(params[:favorite])
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
  end
end