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

ActiveRecord::Schema.define(version: 2019_06_21_160053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string "name"
    t.string "responsibility_type"
    t.bigint "responsibility_id"
    t.string "note"
    t.string "party_type"
    t.bigint "party_id"
    t.bigint "event_id"
    t.float "order_index"
    t.string "auxiliary_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_assignments_on_event_id"
    t.index ["party_type", "party_id"], name: "index_assignments_on_party_type_and_party_id"
    t.index ["responsibility_type", "responsibility_id"], name: "index_assignments_on_responsibility_type_and_responsibility_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_templates", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "event_template_id"
    t.bigint "event_type_id"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_template_id"], name: "index_event_templates_on_event_template_id"
    t.index ["event_type_id"], name: "index_event_templates_on_event_type_id"
  end

  create_table "event_types", force: :cascade do |t|
    t.string "name"
    t.bigint "event_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_category_id"], name: "index_event_types_on_event_category_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "event_template_id"
    t.bigint "event_type_id"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_template_id"], name: "index_events_on_event_template_id"
    t.index ["event_type_id"], name: "index_events_on_event_type_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "officers", force: :cascade do |t|
    t.bigint "office_id"
    t.bigint "user_id"
    t.boolean "is_head", default: false
    t.boolean "is_assistant", default: false
    t.boolean "is_alternative", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_officers_on_office_id"
    t.index ["user_id"], name: "index_officers_on_user_id"
  end

  create_table "offices", force: :cascade do |t|
    t.string "title"
    t.bigint "department_id"
    t.boolean "is_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_offices_on_department_id"
  end

  create_table "responsibilities", force: :cascade do |t|
    t.string "name"
    t.bigint "department_id"
    t.bigint "event_template_id"
    t.float "order_index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_responsibilities_on_department_id"
    t.index ["event_template_id"], name: "index_responsibilities_on_event_template_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: ""
    t.string "encrypted_password", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assignments", "events"
  add_foreign_key "event_templates", "event_templates"
  add_foreign_key "event_templates", "event_types"
  add_foreign_key "event_types", "event_categories"
  add_foreign_key "events", "event_templates"
  add_foreign_key "events", "event_types"
  add_foreign_key "officers", "offices"
  add_foreign_key "officers", "users"
  add_foreign_key "offices", "departments"
  add_foreign_key "responsibilities", "departments"
  add_foreign_key "responsibilities", "event_templates"
end
