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

ActiveRecord::Schema[7.0].define(version: 2023_04_22_121621) do
  create_table "guests", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.integer "invite_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invite_id"], name: "index_guests_on_invite_id"
    t.index ["status"], name: "index_guests_on_status"
  end

  create_table "invites", force: :cascade do |t|
    t.string "family_name"
    t.integer "party_id", null: false
    t.string "invite_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invite_uid"], name: "index_invites_on_invite_uid"
    t.index ["party_id"], name: "index_invites_on_party_id"
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.string "admin_uid"
    t.string "invite_uid"
    t.text "description"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_uid"], name: "index_parties_on_admin_uid"
    t.index ["invite_uid"], name: "index_parties_on_invite_uid"
  end

  add_foreign_key "guests", "invites"
  add_foreign_key "invites", "parties"
end
