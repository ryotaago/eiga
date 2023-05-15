class User::MoviesController < ApplicationController
  def index
    @movies = Movie.all.page(params[:page]).per(20)
  end

  def show
    @movie = Movie.find(params[:id])
    @review = Review.new
    @reviews = Review.all
  end

  def create_review
    @movie = Movie.find(params[:id])
    @review = @movie.reviews.build(review_params)
    if @review.save
      redirect_to movie_path(@movie), notice: 'レビューが投稿されました。'
    else
      render :show
    end
  end


  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

end
