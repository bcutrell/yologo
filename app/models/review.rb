class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :logo

  has_many :votes
  
end
