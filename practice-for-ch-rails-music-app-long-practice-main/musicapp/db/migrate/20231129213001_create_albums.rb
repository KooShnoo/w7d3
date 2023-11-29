class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      # t.integer :band_id
      t.references :band, foreign_key: true
      t.string :title
      t.integer :year
      t.boolean :live

      t.timestamps
    end
    add_index :albums, :title, unique: true
  end
end
