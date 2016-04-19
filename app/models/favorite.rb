class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates_presence_of :user, :movie
end
