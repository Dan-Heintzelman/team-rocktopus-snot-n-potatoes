class VotesController < ApplicationController
  before_action :authenticate!

  def create
    @vote = Vote.create(params[:id])
  end
end