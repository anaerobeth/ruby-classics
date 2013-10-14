class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @posting = Posting.find(params[:posting_id])
  end

  def index
    if params[:posting_id]
      @posting = Posting.find( params[:posting_id] )
      @reviews = Review.where( posting_id: @posting.id )
    else
      @posting = nil
      @reviews = Review.all
    end
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @posting = Posting.find(params[:posting_id])
    @review.posting_id = @posting.id

    if @review.save
      flash[:notice] = 'Thank you for your review.'
      redirect_to posting_reviews_path(@posting)
    else
      render :new
    end
  end

  protected
  def review_params
    params.require(:review).permit(:body, :posting_id)
  end
end

