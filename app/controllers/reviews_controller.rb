class ReviewsController < ApplicationController
  before_action :authenticate!, only [:create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params[review_params])
    if @review.save
      redirect_to new_movie_review
    else
      render 'new'
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :user, :movie)
  end
end
