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

ActiveRecord::Schema.define(version: 20141125155027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: true do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.float    "price",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accessory_orders", force: true do |t|
    t.integer  "order_id",     null: false
    t.integer  "accessory_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "available_trees", force: true do |t|
    t.integer "lot_id",  null: false
    t.integer "tree_id", null: false
  end

  create_table "contacts", force: true do |t|
    t.string   "name",                       null: false
    t.string   "email",                      null: false
    t.string   "phone"
    t.text     "message",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "read",       default: false
  end

  create_table "lots", force: true do |t|
    t.string   "name",                                null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "lots", ["email"], name: "index_lots_on_email", unique: true, using: :btree
  add_index "lots", ["name"], name: "index_lots_on_name", unique: true, using: :btree
  add_index "lots", ["reset_password_token"], name: "index_lots_on_reset_password_token", unique: true, using: :btree

  create_table "orders", force: true do |t|
    t.integer  "tree_id",                      null: false
    t.string   "name",                         null: false
    t.string   "email",                        null: false
    t.string   "address",                      null: false
    t.string   "city",                         null: false
    t.string   "state",                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lot_id"
    t.string   "zipcode",                      null: false
    t.boolean  "delivered",    default: false
    t.integer  "window_id"
    t.string   "instructions"
    t.string   "phone",                        null: false
  end

  create_table "trees", force: true do |t|
    t.string  "height",  null: false
    t.integer "price",   null: false
    t.integer "type_id"
  end

  create_table "types", force: true do |t|
    t.string "name", null: false
  end

  add_index "types", ["name"], name: "index_types_on_name", unique: true, using: :btree

  create_table "windows", force: true do |t|
    t.string "delivery_window"
  end

  create_table "zips", force: true do |t|
    t.integer "lot_id"
    t.string  "code"
  end

end
