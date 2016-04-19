class User < ActiveRecord::Base
	validates_presence_of :username, :email, :password_digest
	validates_uniqueness_of :email
	has_secure_password

	has_many :reviews
	has_many :reviewed_movies, through: :reviews, source: :movie

	has_many :favorites
	has_many :favorited_movies, through: :favorites, source: :movie

	has_many :votes
	has_many :voted_reviews, through: :reviews, source: :votes

	def up_votes
		return self.voted_reviews.select { |vote| vote.helpful}.length
	end

	def down_votes
		return self.voted_reviews.select { |vote| !vote.helpful}.length
	end

	def is_trusted?
		self.up_votes > 5
	end

end
