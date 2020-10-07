class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :date
      t.string :message
      t.integer :foodtruck_id

      t.timestamps
    end
  end
end
