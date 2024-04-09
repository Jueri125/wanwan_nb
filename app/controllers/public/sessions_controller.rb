# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]
  def after_sign_in_path_for(resource)
   public_top_path
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
  protected

  def user_state
    user = User.find_by(email: params[:user][:email])
    return if user.nil?

    return unless user.valid_password?(params[:user][:password])

    unless user.is_active

      flash[:alert] = "アカウントが無効です。"
      redirect_to new_user_registration_path
      return
    end


    sign_in(user)
  end
end
