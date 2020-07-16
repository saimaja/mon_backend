class CreateMonTravels < ActiveRecord::Migration[6.0]
  def change
    create_table :mon_travels do |t|
      t.integer :travelogue_id
      t.integer :monument_id

      t.timestamps
    end
  end
end
