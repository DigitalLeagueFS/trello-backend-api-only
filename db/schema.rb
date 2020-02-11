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

ActiveRecord::Schema.define(version: 2020_02_09_223214) do

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "background_img"
    t.string "background_color"
    t.integer "progress"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "column_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["column_id"], name: "index_cards_on_column_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "columns", force: :cascade do |t|
    t.string "name"
    t.string "background_color"
    t.integer "board_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_columns_on_board_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "board_id", null: false
    t.boolean "is_admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_teams_on_board_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cards", "columns"
  add_foreign_key "cards", "users"
  add_foreign_key "columns", "boards"
  add_foreign_key "teams", "boards"
  add_foreign_key "teams", "users"
end
