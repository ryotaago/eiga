class User::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to movie_path(@movie), notice: 'コメントが作成されました。'
    else
      render :new
    end
  end

  def destroy
  @review = Review.find_by(id: params[:id])
  if @review
    @review.destroy
    redirect_to movie_path(@review.movie), notice: 'コメントが削除されました。'
  else
    redirect_to movie_path(params[:movie_id]), alert: '削除するコメントが見つかりませんでした。'
  end
end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end