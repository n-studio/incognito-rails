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

ActiveRecord::Schema.define(version: 2021_05_06_082246) do

  create_table "incognito_obfuscated_paths", force: :cascade do |t|
    t.string "uuid", null: false
    t.string "session"
    t.string "method"
    t.string "path", null: false
    t.string "query_string"
    t.datetime "expires_at"
    t.index ["expires_at"], name: "index_incognito_obfuscated_paths_on_expires_at"
    t.index ["session"], name: "index_incognito_obfuscated_paths_on_session"
    t.index ["uuid"], name: "index_incognito_obfuscated_paths_on_uuid", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
