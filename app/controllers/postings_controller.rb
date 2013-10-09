class PostingsController < ApplicationController
  def new
    @posting = Posting.new
  end

  def index
    @postings = Posting.order("id").page(params[:page]).per(5)
  end

  def create
    @posting = Posting.new(posting_params)
    @posting.user_id = current_user.id

    if @posting.save
      flash[:notice] = 'Your post has been added to Ruby Classics.'
      redirect_to postings_path(@posting)
    else
      render :new
    end
  end

  def show
    @posting = Posting.find(params[:id])
  end

  def vote
    vote = current_user.posting_votes.new(value: params[:value], posting_id: params[:id])
    if vote.save
      redirect_to :back, notice: "Thank you for voting."
    else
      redirect_to :back, alert: "Unable to vote, perhaps you already did."
    end
  end
  protected
  def posting_params
    params.require(:posting).permit(
      :title, :url, :description, :category)
  end

end
