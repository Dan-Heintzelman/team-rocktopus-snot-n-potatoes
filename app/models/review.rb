class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  has_many :votes

  validates_presence_of :rating, :user, :movie
end
