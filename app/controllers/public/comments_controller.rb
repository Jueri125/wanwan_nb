class Public::CommentsController < ApplicationController
before_action :authenticate_user!

  def create
    @review_type = params[:review_type]

    #case @review_type
    #when 'dog_run'
    #  @review = DogR.find(params[:review_id])
    #when 'dog_cafe'
    #  @review = DogCafe.find(params[:review_id])
    #when 'dog_hotel'
    #  @review = DogHotel.find(params[:review_id])
    #when 'dog_event'
    #  @review = DogEvent.find(params[:review_id])
    #else
    #  redirect_to public_path, alert: '不正なリソースタイプです。'
    #  return
    #end
    @review = Review.find(params[:review_id])
    @comment = @review.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash.now[:notice] = "コメントの投稿に成功しました。"
      case @review.review_type
      when 'dog_run'
        redirect_to public_dog_run_path(@review)
      when 'dog_cafe'
        redirect_to public_dog_cafe_path(@review)
      when 'dog_hotel'
        redirect_to public_dog_hotel_path(@review)
      when 'dog_event'
        redirect_to public_dog_event_path(@review)
      else
        redirect_to public_path, alert: '不正なリソースタイプです。'
      end
    else
      flash.now[:alert] = "コメントの投稿に失敗しました。"
      case @review.review_type
      when 'dog_run'
        render :public_dog_run
      when 'dog_cafe'
        render :public_dog_cafe
      when 'dog_hotel'
        render :public_dog_hotel
      when 'dog_event'
        render :public_dog_event
      else
        render :public
      end
　  end
  end


 def destroy
   @review_type = params[:review_type]
   @review = Review.find(params[:review_id])
  comment = Comment.find_by(id: params[:id])
  if comment
    comment.destroy
    flash[:notice] = "コメントを削除しました。"
  else
    flash[:alert] = "コメントが見つかりませんでした。"
  end

  case @review.review_type
  when 'dog_run'
    redirect_to public_dog_run_path(@review)
  when 'dog_cafe'
    redirect_to public_dog_cafe_path(@review)
  when 'dog_hotel'
    redirect_to public_dog_hotel_path(@review)
  when 'dog_event'
    redirect_to public_dog_event_path(@review)
  else
    redirect_to public_path, alert: '不正なリソースタイプです。'
  end
 end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :review_id)
  end
end