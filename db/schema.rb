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

ActiveRecord::Schema.define(version: 20170922161040) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "album_charts", force: :cascade do |t|
    t.integer "album_id"
    t.integer "chart_id"
  end

  create_table "album_tracks", force: :cascade do |t|
    t.integer "album_id"
    t.integer "track_id"
  end

  create_table "albums", force: :cascade do |t|
    t.string  "title"
    t.integer "genre_id"
    t.integer "album_number"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "charts", force: :cascade do |t|
    t.string "title"
  end

  create_table "genres", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "genre_slug"
  end

  create_table "pdfs", force: :cascade do |t|
    t.text     "name"
    t.string   "location",   default: "app/assets/pdfs"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "scrapes", force: :cascade do |t|
    t.string "name"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "track"
    t.string "artist"
    t.string "category_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "title"
  end

end
