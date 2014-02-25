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

ActiveRecord::Schema.define(version: 20140225011050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "circle_memberships", force: true do |t|
    t.integer  "friend_circle_id", null: false
    t.integer  "user_id",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "circle_memberships", ["friend_circle_id"], name: "index_circle_memberships_on_friend_circle_id", using: :btree
  add_index "circle_memberships", ["user_id"], name: "index_circle_memberships_on_user_id", using: :btree

  create_table "friend_circles", force: true do |t|
    t.string   "name",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friend_circles", ["user_id"], name: "index_friend_circles_on_user_id", using: :btree

  create_table "links", force: true do |t|
    t.integer  "post_id",    null: false
    t.string   "url",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_shares", force: true do |t|
    t.integer  "post_id",          null: false
    t.integer  "friend_circle_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "body",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "upvotes", force: true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "upvotes", ["post_id", "user_id"], name: "index_upvotes_on_post_id_and_user_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree

end
