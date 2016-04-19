class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params[:review])
    if @review.save
      redirect_to new_movie_review
    else
      render 'new'
    end
  end
end