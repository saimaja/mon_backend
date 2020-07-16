class CreateMonuments < ActiveRecord::Migration[6.0]
  def change
    create_table :monuments do |t|
      t.string :name
      t.string :honorees
      t.string :city
      t.string :county
      t.string :state
      t.string :coordinates
      t.string :symbol_type
      t.string :sponsors
      t.string :year_dedicated
      t.string :year_removed
      t.string :tracking_status

      t.timestamps
    end
  end
end
