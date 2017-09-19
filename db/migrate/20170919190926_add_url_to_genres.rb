class AddUrlToGenres < ActiveRecord::Migration[5.0]
  def change
    add_column :genres, :url, :string
  end
end
