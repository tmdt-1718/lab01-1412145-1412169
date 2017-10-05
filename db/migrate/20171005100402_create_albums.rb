class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.text :description
      t.string :urlimg
      t.string :creator
      t.integer :viewcount

      t.timestamps
    end
  end
end
