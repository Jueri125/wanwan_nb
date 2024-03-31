class Public::DogEventsController < ApplicationController
  def index
    @dog_events = Review.where(type: :dog_event)
    @reviews = Review.all
  end

  def show
     @dog_event = Review.find(params[:id])
  end
end
