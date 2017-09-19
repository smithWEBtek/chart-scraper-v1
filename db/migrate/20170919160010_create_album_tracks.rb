class CreateAlbumTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :album_tracks do |t|
      t.integer :album_id
      t.integer :track_id
    end
  end
end
