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

ActiveRecord::Schema[7.2].define(version: 2025_03_25_014648) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "user_id", null: false
    t.bigint "route_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_comments_on_route_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "route_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_favorites_on_route_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "distance"
    t.string "start_location"
    t.string "end_location"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.float "start_lat"
    t.float "start_lng"
    t.float "end_lat"
    t.float "end_lng"
    t.integer "favorites_count", default: 0
    t.index ["user_id"], name: "index_routes_on_user_id"
  end

  create_table "runs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "ran_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "route_id"
    t.index ["user_id"], name: "index_runs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "routes"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "routes"
  add_foreign_key "favorites", "users"
  add_foreign_key "routes", "users"
  add_foreign_key "runs", "users"
end
