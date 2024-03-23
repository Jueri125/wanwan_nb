class Admin::ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end


  def new
    @review = Review.new
  end

  def create
    logger.debug "Form Data: #{params.inspect}"
    review = Review.new(review_params)
    review.save
    redirect_to  admin_review_path(review)
  end
  
  def show
    @review = Review.find(params[:id])
  end



  private
    def review_params
      params.require(:review).permit(:title, :content, :address, :price, :star, :review_type, :image, :prefecture_id)
    end
end
