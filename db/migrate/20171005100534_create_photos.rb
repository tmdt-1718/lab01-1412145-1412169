class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :urlimg
      t.string :creator
      t.integer :viewcount

      t.timestamps
    end
  end
end
