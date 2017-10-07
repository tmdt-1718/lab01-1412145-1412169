class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :creator
      t.string :urlimg
      t.integer :viewcount

      t.timestamps
    end
  end
end
