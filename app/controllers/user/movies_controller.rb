class User::MoviesController < ApplicationController
  def index
    @movies = Movie.all.page(params[:page]).per(20)
  end

  def show
  end
end
