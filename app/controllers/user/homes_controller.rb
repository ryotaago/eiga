class User::HomesController < ApplicationController
  def top
    @movies = Movie.all.order(created_at: :desc).limit(9)
  end
end