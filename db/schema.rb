# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160905033627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.integer  "country_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["country_id"], name: "index_cities_on_country_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "fuelstation_id"
    t.string   "comenmet"
    t.integer  "point"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "comments", ["fuelstation_id"], name: "index_comments_on_fuelstation_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fuel_types", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fuels", force: :cascade do |t|
    t.integer  "fuelstation_id"
    t.integer  "fuel_type_id"
    t.string   "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "fuels", ["fuel_type_id"], name: "index_fuels_on_fuel_type_id", using: :btree
  add_index "fuels", ["fuelstation_id"], name: "index_fuels_on_fuelstation_id", using: :btree

  create_table "fuelstations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.string   "link"
    t.string   "horary"
    t.string   "adress"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "fuelstations", ["user_id"], name: "index_fuelstations_on_user_id", using: :btree

  create_table "photo_fuel_stations", force: :cascade do |t|
    t.integer  "fuelstation_id"
    t.integer  "photo_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "photo_fuel_stations", ["fuelstation_id"], name: "index_photo_fuel_stations_on_fuelstation_id", using: :btree
  add_index "photo_fuel_stations", ["photo_id"], name: "index_photo_fuel_stations_on_photo_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "responsabe"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "services_fuel_stations", force: :cascade do |t|
    t.integer  "fuelstation_id"
    t.integer  "service_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "services_fuel_stations", ["fuelstation_id"], name: "index_services_fuel_stations_on_fuelstation_id", using: :btree
  add_index "services_fuel_stations", ["service_id"], name: "index_services_fuel_stations_on_service_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "lastname"
    t.string   "age"
    t.integer  "city_id"
    t.string   "adress"
    t.string   "description"
    t.integer  "vehicle_id"
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["vehicle_id"], name: "index_users_on_vehicle_id", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "cities", "countries"
  add_foreign_key "comments", "fuelstations"
  add_foreign_key "comments", "users"
  add_foreign_key "fuels", "fuel_types"
  add_foreign_key "fuels", "fuelstations"
  add_foreign_key "fuelstations", "users"
  add_foreign_key "photo_fuel_stations", "fuelstations"
  add_foreign_key "photo_fuel_stations", "photos"
  add_foreign_key "services_fuel_stations", "fuelstations"
  add_foreign_key "services_fuel_stations", "services"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "vehicles"
end
