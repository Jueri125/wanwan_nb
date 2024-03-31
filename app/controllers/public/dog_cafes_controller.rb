class Public::DogCafesController < ApplicationController
  def index
    @dog_cafes = Review.where(type: :dog_cafe)
     @reviews = Review.all
  end

  def show
     @dog_cafe = Review.find(params[:id])
  end
end
