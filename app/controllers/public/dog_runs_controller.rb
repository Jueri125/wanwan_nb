class Public::DogRunsController < ApplicationController

  def index
    @dog_runs = Review.where(type: :dog_run)
    @reviews = Review.all
  end

  def show
     @dog_run = Review.find(params[:id])
     
  end
end
