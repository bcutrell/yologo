class VotesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    @vote = Vote.record_from_user(current_user, params, @review)
    redirect_to :back
  end

  # def update
  #   @vote = Vote.find(params[:id])
  #   if params[:commit] == "" 
  #     @review.update(review_params)
  #       flash[:notice] = "Thanks for the comment"
  #   else
  #       flash[:notice] = "Nice try"
  #   end
    
  #   redirect_to :back   
  # end

    protected
    def review_params
      params.require(:review).permit(:user_id, :review_id, :rating)
    end
end