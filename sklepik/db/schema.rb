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

ActiveRecord::Schema.define(version: 20200113182711) do

  create_table "categories", force: :cascade do |t|
    t.string   "title",       limit: 4000
    t.string   "description", limit: 4000
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "comment",    limit: 4000
    t.integer  "food_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "delivers", force: :cascade do |t|
    t.string   "name",       limit: 4000
    t.string   "car",        limit: 4000
    t.integer  "phone",      limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string   "name",                    limit: 4000
    t.string   "description",             limit: 4000
    t.float    "price"
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.string   "status",                  limit: 4000,       default: "available"
    t.string   "food_image_file_name",    limit: 4000
    t.string   "food_image_content_type", limit: 4000
    t.integer  "food_image_file_size",    limit: 4
    t.datetime "food_image_updated_at"
    t.integer  "category_id",             limit: 4
    t.integer  "prep_time",               limit: 4,          default: 12
    t.text     "sales",                   limit: 2147483647
  end

  add_index "foods", ["category_id"], name: "index_foods_on_category_id"

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity", limit: 4
    t.integer "food_id",  limit: 4
    t.integer "order_id", limit: 4
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"

  create_table "orders", force: :cascade do |t|
    t.string   "Status",         limit: 4000, default: "Pending"
    t.integer  "total",          limit: 4
    t.integer  "vat",            limit: 4
    t.integer  "delivery_cost",  limit: 4
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "transaction_id", limit: 4000
    t.string   "invoice",        limit: 4000
    t.integer  "pickup_time",    limit: 4,    default: 0
  end

  create_table "sysdiagrams", primary_key: "diagram_id", force: :cascade do |t|
    t.string  "name",         limit: 128,        null: false
    t.integer "principal_id", limit: 4,          null: false
    t.integer "version",      limit: 4
    t.binary  "definition",   limit: 2147483647
  end

  add_index "sysdiagrams", ["principal_id", "name"], name: "UK_principal_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "first_name",          limit: 4000
    t.string   "last_name",           limit: 4000
    t.string   "email",               limit: 4000
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "password_digest",     limit: 4000
    t.string   "avatar_file_name",    limit: 4000
    t.string   "avatar_content_type", limit: 4000
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.string   "role",                limit: 4000, default: "user"
    t.varchar  "address",             limit: 255
  end

end
