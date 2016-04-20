class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  has_many :votes

  validates_presence_of :rating, :user, :movie

  def has_voted_by?(current_user)
      vote = Vote.find_by(user_id: current_user.id, review_id: self.id)
  end

  def up_votes
    self.votes.select{|vote| vote.helpful}.length
  end

  def down_votes
    self.votes.select{|vote| !vote.helpful}.length
  end
end
