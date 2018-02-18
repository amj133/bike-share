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

ActiveRecord::Schema.define(version: 20180218195350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conditions", force: :cascade do |t|
    t.datetime "date"
    t.float "max_temp_f"
    t.float "mean_temp_f"
    t.float "min_temp_f"
    t.float "max_dewpoint_f"
    t.float "mean_dewpoint_f"
    t.float "min_dewpoint_f"
    t.float "max_humidity"
    t.float "mean_humidity"
    t.float "min_humidity"
    t.float "max_sea_level_pressure_inches"
    t.float "mean_sea_level_pressure_inches"
    t.float "min_sea_level_pressure_inches"
    t.float "max_visibility_miles"
    t.float "mean_visibility_miles"
    t.float "min_visibility_miles"
    t.float "max_wind_speed"
    t.float "mean_wind_speed"
    t.float "max_gust_speed"
    t.float "precipitation_inches"
    t.float "cloud_cover"
    t.float "events"
    t.float "wind_dir_degrees"
    t.integer "zipcode"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.float "lat"
    t.float "long"
    t.integer "dock_count"
    t.string "city"
    t.datetime "installation_date"
  end

  create_table "statuses", force: :cascade do |t|
    t.bigint "station_id"
    t.integer "bikes_available"
    t.integer "docks_available"
    t.datetime "time"
    t.index ["station_id"], name: "index_statuses_on_station_id"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "duration"
    t.datetime "start_date"
    t.bigint "start_station_id"
    t.datetime "end_date"
    t.bigint "end_station_id"
    t.integer "bike_id"
    t.string "subscription"
    t.integer "zipcode"
    t.index ["end_station_id"], name: "index_trips_on_end_station_id"
    t.index ["start_station_id"], name: "index_trips_on_start_station_id"
  end

  add_foreign_key "statuses", "stations"
end
