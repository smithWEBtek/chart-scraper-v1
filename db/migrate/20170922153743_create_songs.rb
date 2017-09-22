class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :track
      t.string :artist
      t.string :category_id
      
    end
  end
end
