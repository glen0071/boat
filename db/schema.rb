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

ActiveRecord::Schema.define(version: 2019_07_21_220532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.date "birth"
    t.date "death"
    t.string "birth_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quote_themes", force: :cascade do |t|
    t.bigint "theme_id"
    t.bigint "quote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "relevance"
    t.index ["quote_id", "theme_id"], name: "index_quote_themes_on_quote_id_and_theme_id", unique: true
    t.index ["quote_id"], name: "index_quote_themes_on_quote_id"
    t.index ["theme_id"], name: "index_quote_themes_on_theme_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id"
    t.string "source"
    t.string "source_link"
    t.string "year"
    t.index ["author_id"], name: "index_quotes_on_author_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "quote_themes", "quotes"
  add_foreign_key "quote_themes", "themes"
  add_foreign_key "quotes", "authors"
end
