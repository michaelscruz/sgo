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

ActiveRecord::Schema.define(version: 20150416192612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicants", force: true do |t|
    t.integer  "child_id"
    t.integer  "application_id"
    t.string   "grade"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "application_statuses", force: true do |t|
    t.integer  "user_id"
    t.string   "status_code"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applications", force: true do |t|
    t.integer  "school_id"
    t.integer  "applicant_id"
    t.decimal  "requested_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applications", ["applicant_id"], name: "index_applications_on_applicant_id", using: :btree
  add_index "applications", ["school_id"], name: "index_applications_on_school_id", using: :btree

  create_table "children", force: true do |t|
    t.integer  "household_id"
    t.date     "dob"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donations", force: true do |t|
    t.integer  "donor_id"
    t.string   "donor_type"
    t.decimal  "amount"
    t.boolean  "matched"
    t.string   "matching_organization"
    t.decimal  "match_amount"
    t.text     "information"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "donations", ["donor_id"], name: "index_donations_on_donor_id", using: :btree

  create_table "schools", force: true do |t|
    t.string   "name"
    t.decimal  "tuition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address"
    t.string   "phone"
    t.string   "relation"
    t.string   "type"
    t.integer  "school_id"
    t.boolean  "terms_of_use"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
