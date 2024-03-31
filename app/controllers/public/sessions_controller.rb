# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
   public_path
  end

  def after_sign_out_path_for(resource)
   public_path
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  private
  # アクティブであるかを判断するメソッド
  def user_state
    user = User.find_by(email: params[:user][:email])
    return if user.nil?
    return unless user.valid_password?(params[:user][:password])


    if user.is_active
      return
    else
      flash[:alert] = '退会済みのアカウントです。'
      redirect_to new_user_registration_path
    end
  end
    # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
