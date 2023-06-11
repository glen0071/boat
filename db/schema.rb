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

ActiveRecord::Schema.define(version: 2023_06_11_030426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: 6, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "birth"
    t.string "death"
    t.string "birth_location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "about"
    t.boolean "locked", default: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_authors_on_user_id"
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "header"
    t.date "display_date"
    t.string "source"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "author_id"
    t.bigint "topic_id"
    t.bigint "quote_id"
    t.string "klass"
    t.index ["author_id"], name: "index_favorites_on_author_id"
    t.index ["quote_id"], name: "index_favorites_on_quote_id"
    t.index ["topic_id"], name: "index_favorites_on_topic_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "incident_details", force: :cascade do |t|
    t.string "officer_last_name"
    t.bigint "drupal_incident_number"
    t.string "allegation"
    t.string "finding"
    t.string "action"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "incidents", force: :cascade do |t|
    t.bigint "drupal_officer_number"
    t.string "case_number"
    t.string "department"
    t.string "office"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mn_doc_data", force: :cascade do |t|
    t.date "publish_date"
    t.integer "total"
    t.integer "female"
    t.integer "male"
    t.integer "criminal_sexual_conduct"
    t.integer "homicide"
    t.integer "drugs_offense"
    t.integer "weapons_offense"
    t.integer "assault"
    t.integer "assault_domestic"
    t.integer "person"
    t.integer "drugs_type_offense"
    t.integer "weapons_type_offense"
    t.integer "property"
    t.integer "other_type_offense"
    t.integer "dwi"
    t.integer "psi_holds"
    t.integer "number_of_lifers"
    t.float "average_age"
    t.integer "current_inmates_over_fifty"
    t.integer "current_inmates_under_eighteen"
    t.float "average_population"
    t.integer "certified_as_adults"
    t.integer "inmates_employed"
    t.integer "white"
    t.integer "black"
    t.integer "american_indian"
    t.integer "asian"
    t.integer "unknown_other"
    t.integer "hispanic"
    t.integer "grades_0_8"
    t.integer "grades_9_11"
    t.integer "high_school"
    t.integer "ged"
    t.integer "college"
    t.integer "other_unknown_edu"
    t.integer "single"
    t.integer "married"
    t.integer "divorced_separated"
    t.integer "other_unknown_marital"
    t.integer "unknown_no_preference"
    t.integer "other_christian"
    t.integer "other_religions"
    t.integer "catholic"
    t.integer "muslim"
    t.integer "native_american_religions"
    t.integer "lutheran"
    t.integer "baptist"
    t.integer "hennepin"
    t.integer "ramsey"
    t.integer "st_louis"
    t.integer "stearns"
    t.integer "dakota"
    t.integer "faribault"
    t.integer "stillwater"
    t.integer "moose_lake"
    t.integer "lino_lakes"
    t.integer "rush_city"
    t.integer "st_cloud"
    t.integer "shakopee"
    t.integer "oak_park_heights"
    t.integer "willow_river"
    t.integer "togo"
    t.integer "red_wing"
    t.integer "work_release"
    t.integer "county_jail_federal_prison"
    t.integer "institution_community_work_crews"
    t.integer "non_doc_correctional_facility"
    t.integer "new_commitments"
    t.integer "release_return_no_new_sentence"
    t.integer "release_return_new_sentence"
    t.integer "january_june"
    t.integer "july_december"
    t.integer "supervised_release_parole"
    t.integer "community_programs"
    t.integer "discharge"
    t.integer "work_release_covod"
    t.integer "other_release"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "burglary"
    t.integer "larceny"
    t.integer "robbery"
    t.integer "anoka"
    t.integer "washington"
    t.integer "jewish"
    t.integer "total_admissions"
    t.integer "total_releases"
    t.integer "protestant"
    t.integer "stillwater_facility"
    t.integer "st_cloud_facility"
    t.integer "lino_lakes_facility"
    t.integer "shakopee_facility"
    t.integer "willow_river_facility"
  end

  create_table "moo_tasks", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.string "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
    t.datetime "hide_time", precision: 6
  end

  create_table "officers", force: :cascade do |t|
    t.bigint "drupal_id"
    t.string "first_name"
    t.string "last_name"
    t.bigint "badge"
    t.string "department"
    t.string "pic_file_path"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "quote_topics", force: :cascade do |t|
    t.bigint "topic_id"
    t.bigint "quote_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "relevance"
    t.integer "points", default: 0, null: false
    t.index ["quote_id", "topic_id"], name: "index_quote_topics_on_quote_id_and_topic_id", unique: true
    t.index ["quote_id"], name: "index_quote_topics_on_quote_id"
    t.index ["topic_id"], name: "index_quote_topics_on_topic_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "author_id"
    t.string "source_link"
    t.string "date"
    t.boolean "good", default: false
    t.string "context"
    t.bigint "source_id"
    t.string "page"
    t.boolean "locked", default: false
    t.bigint "user_id"
    t.index ["author_id"], name: "index_quotes_on_author_id"
    t.index ["source_id"], name: "index_quotes_on_source_id"
    t.index ["user_id"], name: "index_quotes_on_user_id"
  end

  create_table "small_wins", force: :cascade do |t|
    t.datetime "win_at", precision: 6
    t.integer "count"
    t.bigint "win_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["win_id"], name: "index_small_wins_on_win_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "title"
    t.bigint "author_id"
    t.string "pub_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "alt_title"
    t.string "location"
    t.string "notes"
    t.bigint "user_id"
    t.boolean "locked", default: false
    t.index ["author_id"], name: "index_sources_on_author_id"
    t.index ["user_id"], name: "index_sources_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "locked", default: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wins", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.datetime "started_at", precision: 6
    t.integer "count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_wins_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "authors", "users"
  add_foreign_key "favorites", "authors"
  add_foreign_key "favorites", "quotes"
  add_foreign_key "favorites", "topics"
  add_foreign_key "favorites", "users"
  add_foreign_key "quote_topics", "quotes"
  add_foreign_key "quote_topics", "topics"
  add_foreign_key "quotes", "authors"
  add_foreign_key "quotes", "sources"
  add_foreign_key "quotes", "users"
  add_foreign_key "small_wins", "wins"
  add_foreign_key "sources", "authors"
  add_foreign_key "sources", "users"
  add_foreign_key "topics", "users"
  add_foreign_key "wins", "users"
end
