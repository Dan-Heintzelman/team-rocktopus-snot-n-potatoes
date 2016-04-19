class Movie < ActiveRecord::Base
  has_many :favorites
  has_many :reviews
  has_many :favoriters, through: :favorites, source: :user
  has_many :reviewers, through: :reviews, source: :user

  validates_presence_of :title

  def self.categorize(genre = "Drama")
    return Movie.where(genre: genre)
  end

  def self.trending
    movies = Movie.all
    movies.sort{|movie1, movie2| movie2.favorites.length <=> movie1.favorites.length}
    return movies[0..3]
  end

  def self.featured
    movies = Movie.all
    featured = []
    2.times {featured << movies.sample}
    return featured
  end

end
