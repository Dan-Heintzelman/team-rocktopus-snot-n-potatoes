module ApplicationHelper
  def in_favorites?(user_id, movie_id)
    user = User.find(user_id)
    user.favorites.each do |fav|
      if fav.movie.id == movie_id
        return true
      end
    end
    return false
  end
end
