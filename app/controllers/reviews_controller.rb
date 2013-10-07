class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @posting = Posting.find(params[:id])
  end

  def index
    @reviews = Review.all
  end


end

