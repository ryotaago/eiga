class User::ReviewsController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to movie_path(@movie), notice: 'コメントが作成されました。'
    else
      redirect_to request.referer, alert: '入力してください！'
    end
  end

  def destroy
  @review = Review.find(params[:id])
  if @review.user == current_user
    @review.destroy
    redirect_to movie_path(@review.movie), notice: 'レビューが削除されました。'
  else
    redirect_to movie_path(@review.movie), alert: '他のユーザーのレビューは削除できません。'
  end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end