class CreateAlbumCharts < ActiveRecord::Migration[5.0]
  def change
    create_table :album_charts do |t|
      t.integer :album_id
      t.integer :chart_id
    end
  end
end
