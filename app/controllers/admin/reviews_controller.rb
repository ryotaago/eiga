class Admin::ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.includes(:movie).all
    @reviews = Kaminari.paginate_array(@reviews).page(params[:page]).per(10)
  end

  def show
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    if @review.update(review_params)
      redirect_to admin_movie_reviews_path(@review), notice: 'レビューが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to admin_reviews_path, notice: 'レビューを削除しました。'
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
