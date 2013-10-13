class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def index
    @reviews = Review.all
    @posting = Posting.find(1)
  end

  protected
  def review_params
    params.require(:review).permit(:body, :posting_id)
  end
end

