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

ActiveRecord::Schema.define(version: 20161201195044) do

  create_table "analytics", force: :cascade do |t|
    t.string   "Food"
    t.string   "Day"
    t.integer  "Protein"
    t.integer  "Carbohydrates"
    t.integer  "Fats"
    t.integer  "Calories"
    t.string   "Country"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customersps", force: :cascade do |t|
    t.string   "namesp"
    t.string   "surnamesp"
    t.string   "emailsp"
    t.string   "phonesp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foodsps", force: :cascade do |t|
    t.string   "productsp"
    t.string   "pricesp"
    t.string   "expirysp"
    t.string   "caloriessp"
    t.string   "proteinssp"
    t.string   "sugarsp"
    t.string   "fatsp"
    t.integer  "customersp_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "foodsps", ["customersp_id"], name: "index_foodsps_on_customersp_id"

  create_table "payments", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "last4"
    t.decimal  "amount"
    t.boolean  "success"
    t.string   "authorization_code"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
