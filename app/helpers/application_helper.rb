module ApplicationHelper
  def in_favorites?(movie_id)
    if logged_in?
      user = current_user
      user.favorites.each do |fav|
        if fav.movie.id == movie_id
          return true
        end
      end
      return false
    end
  end
end
