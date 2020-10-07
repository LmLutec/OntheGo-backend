class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :food
      t.integer :customer_service
      t.integer :speed_of_service
      t.integer :foodtruck_id

      t.timestamps
    end
  end
end
