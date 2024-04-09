class Admin::ReviewsController < ApplicationController
 before_action :authenticate_admin!

  def index
    @search_params = review_search_params
      if @search_params.present?
        @reviews = Review.where(review_type: @search_params[:review_type])
      else
        @reviews = Review.all
      end
  end

  def search
    @search_params = review_search_params
    @reviews = Review.where(review_type: @search_params[:review_type])
    render  'admin_search_reviews'
  end


  def new
    @review = Review.new
  end

  def create
    review = Review.new(review_params)
    if review.save
      flash[:notice] = "成功しました。"
      redirect_to admin_reviews_path(review)
    else
      flash.now[:alert] = "失敗しました。"
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    current_image = @review.image
    if @review.update(review_params)
      flash[:notice] = 'レビューが更新されました。'
      redirect_to admin_reviews_path
    else
      @review.image = current_image if @review.image.blank?
      @review.errors.full_messages.each do |msg|
        pp msg
      end
      flash[:error] = 'レビューの更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
  end


  private
    def review_params
      params.require(:review).permit(:title, :content, :address, :price, :star, :review_type, :image, :prefecture_id)
    end
    def review_search_params
    params.permit(:review_type)
    end
end
