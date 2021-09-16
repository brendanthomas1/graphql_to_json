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

ActiveRecord::Schema.define(version: 2021_09_16_130046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address_1"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "animal_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.integer "age"
    t.bigint "animal_type_id"
    t.bigint "zoo_id"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_type_id"], name: "index_animals_on_animal_type_id"
    t.index ["zoo_id"], name: "index_animals_on_zoo_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "seniority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "zoo_id"
    t.bigint "job_id"
    t.index ["job_id"], name: "index_employees_on_job_id"
    t.index ["zoo_id"], name: "index_employees_on_zoo_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.string "education_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zoos", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id"
    t.index ["address_id"], name: "index_zoos_on_address_id"
  end

  add_foreign_key "employees", "jobs"
  add_foreign_key "employees", "zoos"
  add_foreign_key "zoos", "addresses"
end
