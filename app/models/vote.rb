class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates_presence_of :user, :review
  validates_uniqueness_of :user, scope: :review
  validates_inclusion_of :helpful, :in => [true, false]


end
