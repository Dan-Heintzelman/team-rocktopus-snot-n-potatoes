class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates_presence_of :user, :review, :helpful
end
