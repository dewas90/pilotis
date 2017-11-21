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

ActiveRecord::Schema.define(version: 20171121143213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_admins_on_profile_id", using: :btree
  end

  create_table "albums", force: :cascade do |t|
    t.string   "name"
    t.integer  "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "photo"
    t.string   "year"
    t.index ["admin_id"], name: "index_albums_on_admin_id", using: :btree
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "attendees", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attendees_on_event_id", using: :btree
    t.index ["profile_id"], name: "index_attendees_on_profile_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.integer  "admin_id"
    t.integer  "invoice_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "profile_id"
    t.integer  "section_id"
    t.index ["admin_id"], name: "index_events_on_admin_id", using: :btree
    t.index ["invoice_id"], name: "index_events_on_invoice_id", using: :btree
    t.index ["profile_id"], name: "index_events_on_profile_id", using: :btree
    t.index ["section_id"], name: "index_events_on_section_id", using: :btree
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "admin_id"
    t.integer  "profile_id"
    t.date     "date"
    t.integer  "amount"
    t.string   "title"
    t.string   "bank_account"
    t.string   "status",       default: "unpaid"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.date     "due_date"
    t.index ["admin_id"], name: "index_invoices_on_admin_id", using: :btree
    t.index ["profile_id"], name: "index_invoices_on_profile_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "subject"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "admin_id"
    t.integer  "profile_id"
    t.integer  "section_id"
    t.index ["admin_id"], name: "index_messages_on_admin_id", using: :btree
    t.index ["profile_id"], name: "index_messages_on_profile_id", using: :btree
    t.index ["section_id"], name: "index_messages_on_section_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "totem"
    t.string   "birth_date"
    t.string   "address"
    t.string   "zip_code"
    t.string   "city"
    t.string   "country"
    t.string   "phone_number"
    t.string   "photo"
    t.string   "gender"
    t.string   "comment"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "section_id"
    t.index ["section_id"], name: "index_profiles_on_section_id", using: :btree
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.integer  "start_age"
    t.integer  "end_age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "admins", "profiles"
  add_foreign_key "albums", "admins"
  add_foreign_key "attendees", "events"
  add_foreign_key "attendees", "profiles"
  add_foreign_key "events", "admins"
  add_foreign_key "events", "invoices"
  add_foreign_key "events", "profiles"
  add_foreign_key "events", "sections"
  add_foreign_key "invoices", "admins"
  add_foreign_key "invoices", "profiles"
  add_foreign_key "messages", "admins"
  add_foreign_key "messages", "profiles"
  add_foreign_key "messages", "sections"
  add_foreign_key "profiles", "sections"
  add_foreign_key "profiles", "users"
end
