class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :mon_start
      t.string :mon_end
      t.string :tues_start
      t.string :tues_end
      t.string :wed_start
      t.string :wed_end
      t.string :thurs_start
      t.string :thurs_end
      t.string :fri_start
      t.string :fri_end
      t.string :sat_start
      t.string :sat_end
      t.string :sun_start
      t.string :sun_end

      t.string :new_years_day_start
      t.string :new_years_day_end
      t.string :thanksgiving_day_start
      t.string :thanksgiving_day_end
      t.string :christmas_day_start
      t.string :christmas_day_end

      t.integer :food_truck_id

      t.timestamps
    end
  end
end
