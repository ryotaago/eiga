class AddMovieIdToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :movie_id, :integer
    add_index :movies, :movie_id
  end
end
