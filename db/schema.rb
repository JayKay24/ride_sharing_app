# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_08_25_103402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rides", force: :cascade do |t|
    t.string "origin"
    t.string "destination"
    t.integer "remaining_seats"
    t.time "take_off_time"
    t.date "take_off_date"
    t.bigint "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_rides_on_vehicle_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "ride_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ride_id"], name: "index_subscriptions_on_ride_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.string "encrypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "make"
    t.integer "no_of_seats"
    t.string "vehicle_type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reg_no"
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

  add_foreign_key "rides", "vehicles"
  add_foreign_key "subscriptions", "rides"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "vehicles", "users"
end
