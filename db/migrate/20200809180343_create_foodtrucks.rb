class CreateFoodtrucks < ActiveRecord::Migration[6.0]
  def change
    create_table :foodtrucks do |t|
      t.string :name
      t.string :food_type
      t.string :phone_number
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code
      t.integer :likes, default: 0
      t.integer :owner_id
      
      t.timestamps
    end
  end
end
