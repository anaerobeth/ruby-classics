class PostingsController < ApplicationController
  def new
    @posting = Posting.new
  end
end
