class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password
      t.text :about
      t.string :location
      t.string :interests
      t.boolean :admin

      t.timestamps
    end
  end
end
