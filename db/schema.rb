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

ActiveRecord::Schema.define(version: 20171109123316) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.string   "address_type"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id"

  create_table "hotels", force: :cascade do |t|
    t.string   "name"
    t.string   "amenities"
    t.string   "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "room_id"
    t.integer  "user_id"
    t.integer  "number_of_rooms",   default: 1
    t.datetime "checkin_datetime"
    t.datetime "checkout_datetime"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "reservations", ["room_id"], name: "index_reservations_on_room_id"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "room_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "beds"
    t.string   "photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "room_rate"
    t.integer  "inventory"
    t.integer  "room_type_id"
    t.integer  "hotel_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "rooms", ["hotel_id"], name: "index_rooms_on_hotel_id"
  add_index "rooms", ["room_type_id"], name: "index_rooms_on_room_type_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "password_confirmation"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "provider"
    t.string   "uid"
  end

end
