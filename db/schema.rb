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

ActiveRecord::Schema.define(version: 20170418153820) do

  create_table "accounts", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "password_digest"
    t.         "profile_pic",     default: "Default.jpg"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "upload_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_favorites_on_account_id"
    t.index ["upload_id"], name: "index_favorites_on_upload_id"
  end

  create_table "uploads", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.integer  "account_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["account_id"], name: "index_uploads_on_account_id"
  end

end
