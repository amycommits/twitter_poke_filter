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

ActiveRecord::Schema.define(version: 20170404023637) do

  create_table "pokemon_infos", force: :cascade do |t|
    t.string   "pokemon_name"
    t.datetime "despawns_at"
    t.string   "iv_value"
    t.string   "channel"
    t.string   "coordinates"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "short_url"
    t.string   "long_url"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "iv_stats"
    t.string   "location"
  end

  create_table "twitter_filter_pokemons", force: :cascade do |t|
    t.string   "name"
    t.string   "despawns_at"
    t.string   "iv_value"
    t.string   "channel"
    t.string   "coordinates"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "short_url"
    t.string   "long_url"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
