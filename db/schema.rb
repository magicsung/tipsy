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

ActiveRecord::Schema.define(version: 20151104074233) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",               limit: 255, null: false
    t.string   "description",        limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content",    limit: 255,             null: false
    t.string   "user_id",    limit: 255,             null: false
    t.string   "store_id",   limit: 255,             null: false
    t.integer  "rating",     limit: 4,   default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "comments", ["store_id"], name: "index_comments_on_store_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name",       limit: 255,   null: false
    t.string   "phone",      limit: 255,   null: false
    t.string   "email",      limit: 255,   null: false
    t.text     "message",    limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

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

  create_table "event_djships", force: :cascade do |t|
    t.integer  "event_id",   limit: 4, null: false
    t.integer  "djs_id",     limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "event_djships", ["djs_id"], name: "index_event_djships_on_djs_id", using: :btree
  add_index "event_djships", ["event_id"], name: "index_event_djships_on_event_id", using: :btree

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
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "edm_file_name",    limit: 255
    t.string   "edm_content_type", limit: 255
    t.integer  "edm_file_size",    limit: 4
    t.datetime "edm_updated_at"
    t.string   "price",            limit: 255
    t.boolean  "popular",                        default: false
    t.integer  "store_id",         limit: 4,                     null: false
  end

  add_index "events", ["store_id"], name: "index_events_on_store_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "store_id",       limit: 4
    t.integer  "vip_id",         limit: 4
    t.integer  "price",          limit: 4,                         null: false
    t.integer  "quantity",       limit: 4,   default: 1,           null: false
    t.string   "payment_method", limit: 255, default: "new order", null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "qrcode",         limit: 255
  end

  add_index "orders", ["qrcode"], name: "index_orders_on_qrcode", using: :btree
  add_index "orders", ["store_id"], name: "index_orders_on_store_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree
  add_index "orders", ["vip_id"], name: "index_orders_on_vip_id", using: :btree

  create_table "playlists", force: :cascade do |t|
    t.string   "title",      limit: 255,   null: false
    t.text     "content",    limit: 65535, null: false
    t.integer  "djs_id",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "playlists", ["djs_id"], name: "index_playlists_on_djs_id", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "image_url",          limit: 255
    t.string   "phone",              limit: 255
    t.integer  "rating",             limit: 4
    t.string   "description",        limit: 255
    t.string   "location_address",   limit: 255
    t.string   "location_city",      limit: 255
    t.string   "coordinate_lat",     limit: 255
    t.string   "coordinate_lon",     limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "category_id",        limit: 4
    t.string   "yelp_id",            limit: 255
    t.string   "yelp_image",         limit: 255
    t.integer  "comments_count",     limit: 4
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.string   "hours_monday",       limit: 255
    t.string   "hours_tuesday",      limit: 255
    t.string   "hours_wensday",      limit: 255
    t.string   "hours_thursday",     limit: 255
    t.string   "hours_friday",       limit: 255
    t.string   "hours_saturday",     limit: 255
    t.string   "hours_sunday",       limit: 255
  end

  create_table "trades", force: :cascade do |t|
    t.integer  "order_id",     limit: 4,                     null: false
    t.string   "trade_number", limit: 255,                   null: false
    t.boolean  "paid",                       default: false, null: false
    t.text     "params",       limit: 65535
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "trades", ["order_id"], name: "index_trades_on_order_id", using: :btree
  add_index "trades", ["trade_number"], name: "index_trades_on_trade_number", using: :btree

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
    t.string   "authentication_token",   limit: 255
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  create_table "vips", force: :cascade do |t|
    t.string   "name",       limit: 255,                null: false
    t.decimal  "price",                  precision: 10, null: false
    t.integer  "store_id",   limit: 4,                  null: false
    t.integer  "stock",      limit: 4,                  null: false
    t.datetime "datetime",                              null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_foreign_key "orders", "stores"
  add_foreign_key "orders", "users"
  add_foreign_key "orders", "vips"
  add_foreign_key "trades", "orders"
end
