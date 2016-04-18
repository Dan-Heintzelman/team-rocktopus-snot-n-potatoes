class User < ActiveRecord::Base
	validates_presence_of :username, :email
	has_secure_password

	has_many :reviews
	has_many :roovies, through: :reviews, source: :movies

	has_many :favorites
	has_many :foovies, through: :favorites, source: :movies

	has_many :votes
	has_many :voted, through: :votes, source: :reviews
end
