class AddColumnTravelogue < ActiveRecord::Migration[6.0]
  def change
    add_column :travelogues, :title, :string
  end
end
