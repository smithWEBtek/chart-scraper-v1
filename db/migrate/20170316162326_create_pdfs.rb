class CreatePdfs < ActiveRecord::Migration[5.0]
  def change
    create_table :pdfs do |t|
      t.text :name
      t.string :location, default: 'app/assets/pdfs'

      t.timestamps
    end
  end
end
