class VotesController < ApplicationController
  before_action :authenticate!

  def create
    @vote = Vote.create(vote_params)
  end

  private
  def vote_params
    params.require(:votes).permit(:user, :review, :helpful)
  end
end
