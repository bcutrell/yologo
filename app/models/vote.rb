class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :review

  validates_presence_of :user_id
  validates_presence_of :review_id
  validates_presence_of :rating

  validates :rating, numericality: {greater_than_or_equal_to: -1, less_than_or_equal_to: 1}
  validates_numericality_of :user_id
  validates_numericality_of :review_id

end
