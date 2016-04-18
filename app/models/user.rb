class User < ActiveRecord::Base
	validates_presence_of :username, :email
	has_secure_password

	has_many :reviews
	has_many :reviewed_movies, through: :reviews, source: :movie

	has_many :favorites
	has_many :favorited_movies, through: :favorites, source: :movie

	has_many :votes
	has_many :voted_reviews, through: :votes, source: :review
end
