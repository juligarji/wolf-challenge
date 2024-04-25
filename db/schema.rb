# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_25_034337) do
  create_table "availabilities", force: :cascade do |t|
    t.date "date"
    t.integer "seeker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seeker_id"], name: "index_availabilities_on_seeker_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.float "lat"
    t.float "lon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "seeker_id", null: false
    t.integer "role_id", null: false
    t.string "status"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_ratings_on_role_id"
    t.index ["seeker_id"], name: "index_ratings_on_seeker_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seeker_availabilities", force: :cascade do |t|
    t.integer "seeker_id", null: false
    t.integer "availability_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["availability_id"], name: "index_seeker_availabilities_on_availability_id"
    t.index ["seeker_id"], name: "index_seeker_availabilities_on_seeker_id"
  end

  create_table "seekers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seekers_locations", force: :cascade do |t|
    t.integer "seeker_id"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_seekers_locations_on_location_id"
    t.index ["seeker_id"], name: "index_seekers_locations_on_seeker_id"
  end

  add_foreign_key "ratings", "roles"
  add_foreign_key "ratings", "seekers"
  add_foreign_key "seeker_availabilities", "availabilities"
  add_foreign_key "seeker_availabilities", "seekers"
  add_foreign_key "seekers_locations", "locations"
  add_foreign_key "seekers_locations", "seekers"
end
