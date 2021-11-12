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

ActiveRecord::Schema.define(version: 20211112202756) do

  create_table "administrators", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "full_name"
    t.integer  "school_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "administrators", ["email"], name: "index_administrators_on_email", unique: true
  add_index "administrators", ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true

  create_table "consent_forms", force: :cascade do |t|
    t.string  "date"
    t.integer "parent_id"
    t.integer "student_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "district_name"
  end

  create_table "emergency_contacts", force: :cascade do |t|
    t.string "full_name"
    t.string "relation"
    t.string "phone_number"
  end

  create_table "nurses", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "full_name"
    t.integer  "school_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "nurses", ["email"], name: "index_nurses_on_email", unique: true
  add_index "nurses", ["reset_password_token"], name: "index_nurses_on_reset_password_token", unique: true

  create_table "parents", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
  end

  create_table "school_medication_transactions", force: :cascade do |t|
    t.string  "date"
    t.string  "time"
    t.string  "change_in_quantity"
    t.integer "school_medication_id"
    t.integer "student_id"
    t.integer "nurse_id"
  end

  create_table "school_medication_transactions_medications", id: false, force: :cascade do |t|
    t.integer "school_medication_id",             null: false
    t.integer "school_medication_transaction_id", null: false
  end

  create_table "school_medications", force: :cascade do |t|
    t.string  "medication_name"
    t.integer "quantity"
    t.string  "unit"
    t.integer "school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string  "school_name"
    t.integer "district_id"
  end

  create_table "student_medication_transactions", force: :cascade do |t|
    t.string  "date"
    t.string  "time"
    t.string  "change_in_quantity"
    t.integer "student_medication_id"
    t.integer "nurse_id"
  end

  create_table "student_medication_transactions_medications", id: false, force: :cascade do |t|
    t.integer "student_medication_id",             null: false
    t.integer "student_medication_transaction_id", null: false
  end

  create_table "student_medications", force: :cascade do |t|
    t.string  "medication_name"
    t.integer "quantity"
    t.string  "unit"
    t.integer "school_id"
    t.integer "student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string  "full_name"
    t.string  "date_of_birth"
    t.integer "school_id"
    t.integer "emergency_contact_id"
  end

end
