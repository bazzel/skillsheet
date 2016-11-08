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

ActiveRecord::Schema.define(version: 20161108080721) do

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.boolean  "alumni"
    t.string   "image"
    t.text     "bio"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages_technologies", id: false, force: :cascade do |t|
    t.integer "language_id",   null: false
    t.integer "technology_id", null: false
    t.index ["technology_id", "language_id"], name: "index_languages_technologies_on_technology_id_and_language_id"
  end

  create_table "skills", force: :cascade do |t|
    t.integer  "employee_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "technology_id"
    t.index ["employee_id"], name: "index_skills_on_employee_id"
    t.index ["technology_id"], name: "index_skills_on_technology_id"
  end

  create_table "technologies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
