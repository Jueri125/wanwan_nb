class Public::DogCafesController < ApplicationController
  def index
    @dog_cafes = Review.where(type: :dog_cafe)
     @reviews = Review.all
  end

  def show
     @dog_cafe = Review.find(params[:id])
     @comments = @dog_cafe.comments.order(created_at: :desc)
     @comment = Comment.new
     @users = User.all
  end
end
