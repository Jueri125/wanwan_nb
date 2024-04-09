class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
   @user = current_user
   @user.update(user_params)
   redirect_to user_my_page_path
  end
  

  def withdrawal
   @user = current_user
   @user.update(is_active: false)
   reset_session
   redirect_to public_path
  end


  private
  def user_params
    params.require(:user).permit(:name, :name_kana, :email, :image, :introduction)
  end

end

