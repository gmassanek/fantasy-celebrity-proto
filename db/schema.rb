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

ActiveRecord::Schema.define(version: 20150102230159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "league_roster_slots", force: :cascade do |t|
    t.integer  "position_id"
    t.integer  "league_id"
    t.integer  "count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_transactions", force: :cascade do |t|
    t.integer  "player_id"
    t.string   "action"
    t.integer  "team_id"
    t.integer  "old_position_id"
    t.integer  "new_position_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "position_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "point_submissions", force: :cascade do |t|
    t.string   "proof_url"
    t.integer  "scoring_statistic_id"
    t.string   "scoring_statistic_override"
    t.float    "points"
    t.integer  "player_id"
    t.text     "comment"
    t.string   "status"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "point_submissions", ["player_id"], name: "index_point_submissions_on_player_id", using: :btree
  add_index "point_submissions", ["points"], name: "index_point_submissions_on_points", using: :btree
  add_index "point_submissions", ["status"], name: "index_point_submissions_on_status", using: :btree

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "roster_slots", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.integer  "slot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scoring_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scoring_statistics", force: :cascade do |t|
    t.string   "description"
    t.integer  "scoring_category_id"
    t.float    "suggested_points"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "title"
    t.integer  "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
