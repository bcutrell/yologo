class ReviewsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @logo = Logo.find(params[:logo_id])
    @review = Review.record_from_user(current_user, params, @logo)
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