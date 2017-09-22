class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :track
      t.string :artist
      t.string :category

      t.integer :chart_id, default: 1
    end
  end
end
