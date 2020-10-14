class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :type
      t.float :price
      t.integer :menu_id
      t.timestamps
    end
  end
end
