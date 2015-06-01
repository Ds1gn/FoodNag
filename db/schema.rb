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

ActiveRecord::Schema.define(version: 20150530162905) do

  create_table "expirations", force: :cascade do |t|
    t.integer  "food_id"
    t.integer  "user_id"
    t.date     "expires_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "purchase_id"
  end

  add_index "expirations", ["food_id"], name: "index_expirations_on_food_id"
  add_index "expirations", ["purchase_id"], name: "index_expirations_on_purchase_id"
  add_index "expirations", ["user_id"], name: "index_expirations_on_user_id"

  create_table "food_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "food_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "custom_reminder"
  end

  add_index "food_users", ["food_id"], name: "index_food_users_on_food_id"
  add_index "food_users", ["user_id"], name: "index_food_users_on_user_id"

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "shelf_life"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "food_category_id"
  end

  add_index "foods", ["food_category_id"], name: "index_foods_on_food_category_id"

  create_table "purchases", force: :cascade do |t|
    t.date     "purchase_date"
    t.integer  "food_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.datetime "deleted_at"
  end

  add_index "purchases", ["deleted_at"], name: "index_purchases_on_deleted_at"
  add_index "purchases", ["food_id"], name: "index_purchases_on_food_id"
  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id"

  create_table "recipes", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "purchase_id"
    t.string   "recipe_title"
    t.string   "recipe_label"
    t.string   "recipe_image"
    t.string   "recipe_url"
    t.string   "recipe_ingredient"
  end

  add_index "recipes", ["purchase_id"], name: "index_recipes_on_purchase_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.boolean  "admin",                  default: false
    t.boolean  "advertiser",             default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
