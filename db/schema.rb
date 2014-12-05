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

ActiveRecord::Schema.define(version: 20141205191334) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: true do |t|
    t.integer  "department_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "assignments", ["department_id"], name: "index_assignments_on_department_id", using: :btree

  create_table "departments", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_department_id"
  end

  add_index "departments", ["name"], name: "index_departments_on_name", using: :btree
  add_index "departments", ["parent_department_id"], name: "index_departments_on_parent_department_id", using: :btree

  create_table "functions", force: true do |t|
    t.integer  "teacher_id"
    t.integer  "department_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "leader?",       default: true
  end

  add_index "functions", ["teacher_id", "department_id"], name: "index_functions_on_teacher_id_and_department_id", using: :btree

  create_table "teachers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "email"
    t.boolean  "email_secret"
    t.string   "phone"
    t.boolean  "phone_secret"
    t.string   "phone2"
    t.boolean  "phone_secret2"
    t.integer  "activity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.text     "description"
  end

  add_index "teachers", ["first_name"], name: "index_teachers_on_first_name", using: :btree

end
