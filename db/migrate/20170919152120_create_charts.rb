class CreateCharts < ActiveRecord::Migration[5.0]
  def change
    create_table :charts do |t|
      t.string :title
      t.integer :genre_id
			t.integer :album_id
			
    end
  end
end
