# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_04_063753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "trainer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trainer_id"], name: "index_companies_on_trainer_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.string "course_type"
    t.string "address"
    t.datetime "start"
    t.datetime "end"
    t.integer "min_participants"
    t.integer "max_participants"
    t.integer "price"
    t.boolean "prepayment"
    t.bigint "trainer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trainer_id"], name: "index_courses_on_trainer_id"
  end

  create_table "participations", force: :cascade do |t|
    t.boolean "paid", default: false
    t.integer "donation"
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_participations_on_course_id"
    t.index ["student_id"], name: "index_participations_on_student_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "trainer_id", null: false
    t.integer "balance_course_group", default: 0
    t.integer "balance_course_perso", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_relationships_on_student_id"
    t.index ["trainer_id"], name: "index_relationships_on_trainer_id"
  end

  create_table "slots", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer "transition"
    t.string "description"
    t.string "address"
    t.bigint "trainer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trainer_id"], name: "index_slots_on_trainer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "description", default: "", null: false
    t.string "role", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "companies", "users", column: "trainer_id"
  add_foreign_key "courses", "users", column: "trainer_id"
  add_foreign_key "participations", "courses"
  add_foreign_key "participations", "users", column: "student_id"
  add_foreign_key "relationships", "users", column: "student_id"
  add_foreign_key "relationships", "users", column: "trainer_id"
  add_foreign_key "slots", "users", column: "trainer_id"
end
