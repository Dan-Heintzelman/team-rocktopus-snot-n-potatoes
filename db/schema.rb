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

ActiveRecord::Schema.define(version: 20160418195119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorites", ["movie_id"], name: "index_favorites_on_movie_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "tagline"
    t.text     "overview"
    t.string   "photo_path"
    t.string   "genre"
    t.string   "runtime"
    t.string   "release_date"
    t.boolean  "approved",     default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end
  
  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["movie_id"], name: "index_reviews_on_movie_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree


  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "review_id"
    t.boolean  "helpful"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["review_id"], name: "index_votes_on_review_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "favorites", "movies"
  add_foreign_key "favorites", "users"
  add_foreign_key "reviews", "movies"
  add_foreign_key "reviews", "users"
  add_foreign_key "votes", "reviews"
  add_foreign_key "votes", "users"
end
