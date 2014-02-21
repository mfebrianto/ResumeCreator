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

ActiveRecord::Schema.define(version: 20140221045426) do

  create_table "backend_customers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_url"
    t.integer  "user_id",            null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "backend_customers", ["user_id"], name: "backend_customers_user_id_fk", using: :btree

  create_table "backend_designs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "backend_educations", force: true do |t|
    t.string   "activities"
    t.integer  "backend_customer_id"
    t.string   "degree"
    t.datetime "end_date"
    t.string   "field_of_study"
    t.string   "notes"
    t.string   "school_name"
    t.datetime "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "backend_educations", ["backend_customer_id"], name: "backend_educations_backend_customer_id_fk", using: :btree

  create_table "backend_positions", force: true do |t|
    t.string   "industry"
    t.integer  "backend_customer_id"
    t.string   "name"
    t.string   "size"
    t.string   "company_type"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "summary"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "backend_positions", ["backend_customer_id"], name: "backend_positions_backend_customer_id_fk", using: :btree

  create_table "linkedin_data", force: true do |t|
    t.string   "email",        null: false
    t.string   "access_token", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "linkedin_data", ["email"], name: "index_linkedin_data_on_email", unique: true, using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "api_key"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "backend_customers", "users", name: "backend_customers_user_id_fk"

  add_foreign_key "backend_educations", "backend_customers", name: "backend_educations_backend_customer_id_fk"

  add_foreign_key "backend_positions", "backend_customers", name: "backend_positions_backend_customer_id_fk"

end
