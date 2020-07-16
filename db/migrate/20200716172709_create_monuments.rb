class CreateMonuments < ActiveRecord::Migration[6.0]
  def change
    create_table :monuments do |t|
      t.string :name
      t.string :honorees
      t.string :city
      t.string :county
      t.string :state
      t.float :latitude, :precision => 10, :scale => 6
      t.float :longitude, :precision => 10, :scale => 6
      t.string :symbol_type
      t.string :sponsors
      t.integer :year_dedicated
      t.integer :year_removed
      t.string :tracking_status

      t.timestamps
    end
  end
end
