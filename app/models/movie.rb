class Movie < ActiveRecord::Base
  has_many :favorites
  has_many :reviews
  has_many :favoriters, through: :favorites, source: :user
  has_many :reviewers, through: :reviews, source: :user

  validates_presence_of :title

  def categorize(genre)
    return Movie.where(genre: genre)
  end

  def trending
    movies = Movie.all
    movies.sort{|movie1, movie2| movie2.votes.length <=> movie1.votes.length}
    return movies[0..4]
  end

  def featured
    movies = Movie.all
    featured = []
    2.times {featured << movies.sample}
    return featured
  end

end
