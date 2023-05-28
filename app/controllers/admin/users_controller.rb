class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = Kaminari.paginate_array(User.all).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: 'ユーザー情報が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'ユーザーを削除しました。'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :is_active)
  end
end
