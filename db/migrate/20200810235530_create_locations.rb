class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :state
      t.integer :foodtruck_id

      t.timestamps
    end
  end
end
