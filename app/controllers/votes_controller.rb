class VotesController < ApplicationController
  before_action :authenticate!

  def create
    puts "@@@@@@@@@@@@ Our params are #{params}"
    puts params[:helpful]
    @review = Review.find(params[:review_id])
    @vote = @review.votes.create(helpful: params[:helpful])
    @vote.user = current_user
    if @vote.save
      redirect_to @review.movie
    else
      @errors = @vote.errors
      render 'movies/show'
    end
  end

  def update
    @vote = Vote.find(params[:vote_id])
    @review = Review.find(params[:review_id])
    @vote.update(helpful: params[:helpful])
    if @vote.save
      redirect_to @review.movie
    else
      @errors = @vote.errors
      render 'movies/show'
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:helpful)
  end
end
