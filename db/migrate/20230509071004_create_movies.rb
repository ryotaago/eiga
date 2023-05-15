class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :overview
      t.string :image
      t.integer :year
      t.string :genres_name
      t.string :runtime
      t.timestamps
    end
  end
end
