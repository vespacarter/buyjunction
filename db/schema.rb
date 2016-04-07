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

ActiveRecord::Schema.define(version: 20160406111550) do

  create_table "buys", force: :cascade do |t|
    t.integer  "item_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "payment_sent",     default: false
    t.boolean  "payment_received", default: false
    t.integer  "user_id"
    t.boolean  "item_sent",        default: false
    t.boolean  "item_received",    default: false
    t.boolean  "marked_as_voted",  default: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "seller"
    t.string   "seller_url"
    t.integer  "prize"
    t.integer  "min_units"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.date     "expiration_date"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "number_of_buyers",    default: 0
    t.integer  "user_id"
    t.boolean  "open_to_apply",       default: true
    t.boolean  "open_to_pay",         default: false
    t.boolean  "open_to_send",        default: false
    t.boolean  "all_sent",            default: false
    t.boolean  "closed_status",       default: false
    t.string   "category"
    t.string   "form_of_payment"
    t.string   "payment_details"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "from"
    t.string   "subject"
    t.string   "body"
    t.boolean  "read",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "item_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "score"
    t.string  "description"
    t.integer "user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "fullname"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
