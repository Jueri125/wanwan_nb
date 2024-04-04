class Public::DogEventsController < ApplicationController
  def index
    @dog_events = Review.where(type: :dog_event)
    @reviews = Review.all
  end

  def show
     @dog_event = Review.find(params[:id])
     @comments = @dog_event.comments.order(created_at: :desc)
     @comment = Comment.new
     @users = User.all
  end
end
