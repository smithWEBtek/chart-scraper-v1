class AddGenreSlugToGenres < ActiveRecord::Migration[5.0]
  def change
    add_column :genres, :genre_slug, :string
  end
end
