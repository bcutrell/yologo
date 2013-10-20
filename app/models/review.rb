class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :logo

  has_many :votes

  class << self
    def record_from_user(user, params, logo)
      review = user.reviews.where(logo_id: logo.id).first
      review ||= logo.reviews.build{|r| r.user = user}

      if params[:commit] == 'Like'
        review.vote = 1
        review.save
      elsif params[:commit] == 'Dislike'
        review.vote = -1
        review.save
      end

      review
    end
  end

  def user_check(user)
      self.votes.each do |vote|
      if vote.user == user
        return true
      end
    end
  end


  def rating_count(user, logo)
    if user_check(user)
      user.votes.each do |vote|
        if vote.review.logo == logo
          return vote.rating
        end
      end
    end
  end

end
