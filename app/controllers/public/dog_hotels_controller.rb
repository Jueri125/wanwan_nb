class Public::DogHotelsController < ApplicationController
  def index
    @dog_hotels = Review.where(type: :dog_hotel)
     @reviews = Review.all
  end

  def show
     @dog_hotel = Review.find(params[:id])
  end
end
