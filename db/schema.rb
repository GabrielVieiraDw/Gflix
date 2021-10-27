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

ActiveRecord::Schema.define(version: 2021_10_27_194452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.string "favoritable_type", null: false
    t.bigint "favoritable_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.boolean "highlighted", default: false
    t.string "title"
    t.text "description"
    t.string "thumbnail_key"
    t.string "video_key"
    t.integer "episode_number"
    t.string "featured_thumbnail_key"
    t.bigint "sitcom_id"
    t.bigint "category_id"
    t.string "thumbnail_cover_key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_movies_on_category_id"
    t.index ["sitcom_id"], name: "index_movies_on_sitcom_id"
  end

  create_table "players", force: :cascade do |t|
    t.datetime "start_date"
    t.time "elapsed_time"
    t.bigint "movie_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_players_on_movie_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "rates", force: :cascade do |t|
    t.integer "rating"
    t.text "description"
    t.string "rateable_type", null: false
    t.bigint "rateable_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rateable_type", "rateable_id"], name: "index_rates_on_rateable"
    t.index ["user_id"], name: "index_rates_on_user_id"
  end

  create_table "sitcoms", force: :cascade do |t|
    t.boolean "highlighted", default: false
    t.string "title"
    t.text "description"
    t.string "thumbnail_key"
    t.bigint "category_id", null: false
    t.string "featured_thumbnail_key"
    t.string "thumbnail_cover_key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "last_watched_episode_id", null: false
    t.index ["category_id"], name: "index_sitcoms_on_category_id"
    t.index ["last_watched_episode_id"], name: "index_sitcoms_on_last_watched_episode_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "users"
  add_foreign_key "movies", "categories"
  add_foreign_key "movies", "sitcoms"
  add_foreign_key "players", "movies"
  add_foreign_key "players", "users"
  add_foreign_key "rates", "users"
  add_foreign_key "sitcoms", "categories"
  add_foreign_key "sitcoms", "movies", column: "last_watched_episode_id"
end
