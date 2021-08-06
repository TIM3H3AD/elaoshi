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

ActiveRecord::Schema.define(version: 2021_08_06_180923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "elements", force: :cascade do |t|
    t.integer "style"
    t.string "text"
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "report_id"
    t.index ["report_id"], name: "index_elements_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "course"
    t.integer "level"
    t.integer "unit"
    t.integer "classroom"
    t.string "student_name"
    t.string "scored_lead_0"
    t.string "scored_lead_1"
    t.string "scored_lead_2"
    t.string "scored_lead_3"
    t.string "scored_lead_4"
    t.string "greeting"
    t.string "salutation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "element_id"
    t.index ["element_id"], name: "index_reports_on_element_id"
  end

  add_foreign_key "elements", "reports"
  add_foreign_key "reports", "elements"
end
