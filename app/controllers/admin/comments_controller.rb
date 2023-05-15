class Admin::CommentsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:review_id])
    @comment = @review.comments.build(comment_params)
    
    if @comment.save
      redirect_to movie_path(@movie), notice: 'コメントが投稿されました。'
    else
      # エラーハンドリングの処理を記述する（例: エラーメッセージを表示する）
      render 'user/movies/show'
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end

  def destroy
  end
end
