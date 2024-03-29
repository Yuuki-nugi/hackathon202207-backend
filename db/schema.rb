# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_16_184412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "work_id"
    t.bigint "user_id"
    t.string "text", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["work_id"], name: "index_comments_on_work_id"
  end

  create_table "feeling_records", force: :cascade do |t|
    t.bigint "work_id"
    t.integer "degree", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["work_id"], name: "index_feeling_records_on_work_id"
  end

  create_table "feelings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "work_id"
    t.integer "degree", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_feelings_on_user_id"
    t.index ["work_id"], name: "index_feelings_on_work_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "work_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_participants_on_user_id"
    t.index ["work_id"], name: "index_participants_on_work_id"
  end

  create_table "progresses", force: :cascade do |t|
    t.bigint "work_id"
    t.bigint "theme_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["theme_id"], name: "index_progresses_on_theme_id"
    t.index ["work_id"], name: "index_progresses_on_work_id"
  end

  create_table "themes", force: :cascade do |t|
    t.bigint "work_id"
    t.string "title", null: false
    t.string "result", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["work_id"], name: "index_themes_on_work_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.string "work_name", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_works_on_user_id"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "comments", "works"
  add_foreign_key "feeling_records", "works", on_delete: :cascade
  add_foreign_key "feelings", "users"
  add_foreign_key "feelings", "works", on_delete: :cascade
  add_foreign_key "participants", "users"
  add_foreign_key "participants", "works", on_delete: :cascade
  add_foreign_key "progresses", "themes", on_delete: :cascade
  add_foreign_key "progresses", "works", on_delete: :cascade
  add_foreign_key "themes", "works", on_delete: :cascade
  add_foreign_key "works", "users"
end
