# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_09_215358) do

  create_table "foodtrucks", force: :cascade do |t|
    t.string "name"
    t.string "food_type"
    t.string "phone_number"
    t.integer "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.integer "menu_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menus", force: :cascade do |t|
    t.integer "foodtruck_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string "mon_start"
    t.string "mon_end"
    t.string "tues_start"
    t.string "tues_end"
    t.string "wed_start"
    t.string "wed_end"
    t.string "thurs_start"
    t.string "thurs_end"
    t.string "fri_start"
    t.string "fri_end"
    t.string "sat_start"
    t.string "sat_end"
    t.string "sun_start"
    t.string "sun_end"
    t.string "new_years_day_start"
    t.string "new_years_day_end"
    t.string "thanksgiving_day_start"
    t.string "thanksgiving_day_end"
    t.string "christmas_day_start"
    t.string "christmas_day_end"
    t.integer "foodtruck_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
