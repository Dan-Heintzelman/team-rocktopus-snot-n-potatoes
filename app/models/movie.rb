class Movie < ActiveRecord::Base
  has_many :favorites
  has_many :reviews
  has_many :favoriters, through: :favorites, source: :user
  has_many :reviewers, through: :reviews, source: :user

end
