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

ActiveRecord::Schema.define(version: 20151014122841) do

  create_table "djs", force: :cascade do |t|
    t.string   "name",               limit: 255, null: false
    t.string   "description",        limit: 255
    t.string   "photo_url",          limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.string   "status",           limit: 255
    t.text     "description",      limit: 65535
    t.string   "contact",          limit: 255
    t.string   "phone",            limit: 255
    t.string   "city",             limit: 255
    t.string   "address",          limit: 255
    t.date     "start_date"
    t.time     "start_time"
    t.date     "due_date"
    t.time     "due_time"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "edm_file_name",    limit: 255
    t.string   "edm_content_type", limit: 255
    t.integer  "edm_file_size",    limit: 4
    t.datetime "edm_updated_at"
  end

  create_table "stores", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "image_url",        limit: 255
    t.string   "phone",            limit: 255
    t.integer  "rating",           limit: 4
    t.string   "description",      limit: 255
    t.string   "hours",            limit: 255
    t.string   "location_address", limit: 255
    t.string   "location_city",    limit: 255
    t.float    "coordinate_lat",   limit: 24
    t.float    "coordinate_lon",   limit: 24
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255,                  null: false
    t.string   "email",                  limit: 255, default: "",     null: false
    t.string   "encrypted_password",     limit: 255, default: "",     null: false
    t.string   "role",                   limit: 255, default: "user"
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "token",                  limit: 255
    t.string   "image",                  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

end
