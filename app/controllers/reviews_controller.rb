class ReviewsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @logo = Logo.find(params[:logo_id])
    if @logo.reviews.count == 0
      @review = @logo.reviews.build
      @review.user_id = current_user.id
      if params[:commit] == 'Like'
        @review.vote = 1
        @review.save
      elsif params[:commit] == 'Dislike' 
        @review.vote = -1
        @review.save
      end
    else
      @review = current_user.reviews.where(logo_id: @logo.id).first
      if params[:commit] == 'Like'
        @review.vote = 1
        @review.save
      elsif params[:commit] == 'Dislike' 
        @review.vote = -1
        @review.save
      end
    end

    redirect_to :back
  end

  def update
    @review = Review.find(params[:id])
    if params[:commit] == "Comment" 
      @review.update(review_params)
        flash[:notice] = "Sweet Comment Bro!"
    else
        flash[:notice] = "nice try"
    end



    redirect_to :back   
  end

    protected
    def review_params
      params.require(:review).permit(:comment,:vote)
    end
end