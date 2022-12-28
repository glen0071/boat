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

ActiveRecord::Schema.define(version: 20_221_228_142_909) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'authors', force: :cascade do |t|
    t.string 'name'
    t.string 'birth'
    t.string 'death'
    t.string 'birth_location'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.text 'about'
    t.boolean 'locked', default: false
    t.bigint 'user_id'
    t.index ['user_id'], name: 'index_authors_on_user_id'
  end

  create_table 'blog_posts', force: :cascade do |t|
    t.string 'title'
    t.text 'body'
    t.string 'url'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'favorites', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'author_id'
    t.bigint 'topic_id'
    t.bigint 'quote_id'
    t.string 'klass'
    t.index ['author_id'], name: 'index_favorites_on_author_id'
    t.index ['quote_id'], name: 'index_favorites_on_quote_id'
    t.index ['topic_id'], name: 'index_favorites_on_topic_id'
    t.index ['user_id'], name: 'index_favorites_on_user_id'
  end

  create_table 'moo_tasks', force: :cascade do |t|
    t.string 'name'
    t.string 'status'
    t.string 'notes'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'category'
    t.datetime 'hide_time', precision: 6
  end

  create_table 'quote_topics', force: :cascade do |t|
    t.bigint 'topic_id'
    t.bigint 'quote_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'relevance'
    t.integer 'points', default: 0, null: false
    t.index %w[quote_id topic_id], name: 'index_quote_topics_on_quote_id_and_topic_id', unique: true
    t.index ['quote_id'], name: 'index_quote_topics_on_quote_id'
    t.index ['topic_id'], name: 'index_quote_topics_on_topic_id'
  end

  create_table 'quotes', force: :cascade do |t|
    t.text 'text'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'author_id'
    t.string 'source_link'
    t.string 'date'
    t.boolean 'good', default: false
    t.string 'context'
    t.bigint 'source_id'
    t.string 'page'
    t.boolean 'locked', default: false
    t.bigint 'user_id'
    t.index ['author_id'], name: 'index_quotes_on_author_id'
    t.index ['source_id'], name: 'index_quotes_on_source_id'
    t.index ['user_id'], name: 'index_quotes_on_user_id'
  end

  create_table 'small_wins', force: :cascade do |t|
    t.datetime 'win_at', precision: 6
    t.integer 'count'
    t.bigint 'win_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['win_id'], name: 'index_small_wins_on_win_id'
  end

  create_table 'sources', force: :cascade do |t|
    t.string 'title'
    t.bigint 'author_id'
    t.string 'pub_date'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'alt_title'
    t.string 'location'
    t.string 'notes'
    t.bigint 'user_id'
    t.boolean 'locked', default: false
    t.index ['author_id'], name: 'index_sources_on_author_id'
    t.index ['user_id'], name: 'index_sources_on_user_id'
  end

  create_table 'topics', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.boolean 'locked', default: false
    t.bigint 'user_id'
    t.index ['user_id'], name: 'index_topics_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at', precision: 6
    t.datetime 'remember_created_at', precision: 6
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.boolean 'admin', default: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'wins', force: :cascade do |t|
    t.bigint 'user_id'
    t.string 'name'
    t.datetime 'started_at', precision: 6
    t.integer 'count'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_wins_on_user_id'
  end

  add_foreign_key 'authors', 'users'
  add_foreign_key 'favorites', 'authors'
  add_foreign_key 'favorites', 'quotes'
  add_foreign_key 'favorites', 'topics'
  add_foreign_key 'favorites', 'users'
  add_foreign_key 'quote_topics', 'quotes'
  add_foreign_key 'quote_topics', 'topics'
  add_foreign_key 'quotes', 'authors'
  add_foreign_key 'quotes', 'sources'
  add_foreign_key 'quotes', 'users'
  add_foreign_key 'small_wins', 'wins'
  add_foreign_key 'sources', 'authors'
  add_foreign_key 'sources', 'users'
  add_foreign_key 'topics', 'users'
  add_foreign_key 'wins', 'users'
end
