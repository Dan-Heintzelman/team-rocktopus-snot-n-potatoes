class ReviewsController < ApplicationController
  before_action :authenticate!, only: [:create]

  def create
    params[:review] = {rating: params[:rating], comment: params[:review][:comment]}
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.create(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @movie
    else
      @errors = @review.errors
      render 'movies/show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
