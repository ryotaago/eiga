class User::UsersController < ApplicationController
  before_action :authenticate_user! # ユーザーがログインしていることを確認
  

  def show
    @user = User.find(params[:id])  # レビューに関連するユーザーの情報を取得
    @reviews = @user.reviews
  end
end
