class ReviewsController < ApplicationController
  before_action :find_play, only: [:edit, :update, :show, :destroy]

  def new
    @play = Play.find(params[:play_id])
    @review = Review.new
  end

  def create
    @play = Play.find(params[:play_id])
    @review = Review.new(review_params)
    @review.play_id = @play.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to play_path(@play)
    else
      render "new"
    end
  end

  private

  def find_play
    @play = Play.find(params[:play_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
  
end
