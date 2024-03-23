class Public::DogRunsController < ApplicationController
  
  def index
    @dog_runs = DogRun.where(type: :dog_run)
  end

  def show
     @dog_run = Review.find(params[:id])
  end
end
