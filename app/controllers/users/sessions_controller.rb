# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in user
    redirect_to movies_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.valid_password?(params[:user][:password])
      if user.is_active?
        sign_in user
        redirect_to movies_path, notice: 'ログインしました。'
      else
        redirect_to new_user_session_path, alert: '退会済みのためログインできません。'
      end
    else
      redirect_to new_user_session_path, alert: 'メールアドレスまたはパスワードが正しくありません。'
    end
  end
  # before_action :configure_sign_in_params, only: [:create]

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
