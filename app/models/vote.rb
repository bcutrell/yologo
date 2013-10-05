class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :review

  validates_presence_of :user_id
  validates_presence_of :review_id
  validates_presence_of :rating

  validates :rating, numericality: {greater_than_or_equal_to: -1, less_than_or_equal_to: 1}
  validates_numericality_of :user_id
  validates_numericality_of :review_id
  
    class << self
    def record_from_user(user, params, review)
      vote = user.votes.where(review_id: review.id).first
      vote ||= review.votes.build{|r| r.user = user}

      if params[:commit] == 'Rad'
        vote.rating = 1
        vote.save
      elsif params[:commit] == 'Bad' 
        vote.rating = -1
        vote.save
      end

      vote
    end
  end

end
