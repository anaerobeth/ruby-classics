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

  def posting_params
    params.require(:posting).permit(
      :title, :url, :description, :category)
  end

end
