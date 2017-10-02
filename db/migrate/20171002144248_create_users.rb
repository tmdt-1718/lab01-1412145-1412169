class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :avatar
      t.text :information
      t.text :address
      t.string :fullname

      t.timestamps
    end
  end
end
