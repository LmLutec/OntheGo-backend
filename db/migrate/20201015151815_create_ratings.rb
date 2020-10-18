class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.string :customer_service
      t.string :food_quality
      t.string :prices
      t.string :speed_of_service
      t.integer :foodtruck_id

      t.timestamps
    end
  end
end
