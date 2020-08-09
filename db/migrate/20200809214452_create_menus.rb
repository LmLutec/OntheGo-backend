class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.integer :foodtruck_id
      t.integer :fooditem_id

      t.timestamps
    end
  end
end
