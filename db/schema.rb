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

ActiveRecord::Schema.define(version: 20170224222021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "answer",     null: false
    t.integer  "comment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "businesses", force: :cascade do |t|
    t.string   "company",       null: false
    t.string   "company_field", null: false
    t.string   "phone_bus",     null: false
    t.string   "address",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "comment",    null: false
    t.integer  "user_id",    null: false
    t.integer  "task_id",    null: false
    t.integer  "job_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "title",         null: false
    t.string   "address",       null: false
    t.string   "description",   null: false
    t.string   "company_field", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "description", null: false
    t.integer  "user_id",     null: false
    t.integer  "job_id",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "f_name",          null: false
    t.string   "l_name",          null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "title",           null: false
    t.string   "phone",           null: false
    t.integer  "business_id",     null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
