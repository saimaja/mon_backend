class CreateTravelogues < ActiveRecord::Migration[6.0]
  def change
    create_table :travelogues do |t|
      t.text :blog
      t.integer :user_id

      t.timestamps
    end
  end
end
