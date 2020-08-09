class CreateFoodTrucks < ActiveRecord::Migration[6.0]
  def change
    create_table :foodtrucks do |t|
      t.string :name
      t.string :food_type
      t.string :phone_number
      t.integer :owner_id

      t.timestamps
    end
  end
end
