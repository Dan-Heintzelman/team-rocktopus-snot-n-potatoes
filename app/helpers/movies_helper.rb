module MoviesHelper
  def random_genre
    genres = ["Comedy", "Action", "Romance", "Drama", "Horror", "Adventure", "Animation", "Crime", "Fantasy", "Mystery", "Western", "Thriller"]
    genres.sample(1)
  end

  def imdb_ish
  end
end
