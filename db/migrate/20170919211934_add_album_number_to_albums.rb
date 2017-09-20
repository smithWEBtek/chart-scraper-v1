class AddAlbumNumberToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :album_number, :integer
  end
end
