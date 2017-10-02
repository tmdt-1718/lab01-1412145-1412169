class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :viewcount
      t.string :username
      t.boolean :isdeleted
      t.string :urlimg

      t.timestamps
    end
  end
end
