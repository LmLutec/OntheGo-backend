class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :item_type
      t.float :price
      t.string :description
      t.integer :menu_id
      t.timestamps
    end
  end
end
