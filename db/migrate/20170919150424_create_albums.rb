class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
			t.string :title
			t.integer :genre_id
			
    end
  end
end
