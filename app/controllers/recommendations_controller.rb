class RecommendationsController < ApplicationController
  def create
    posting = Posting.find(params[:posting_id])
    recommendation = Recommendation.new
    recommendation.user_id = current_user.id
    recommendation.posting_id = posting.id
    if recommendation.save
      redirect_to(:back, notice: "You recommended #{posting.title}")
    else
      redirect_to(:back, notice: "You already recommended #{posting.title}")

    end
  end


end
