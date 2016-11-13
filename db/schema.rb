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

ActiveRecord::Schema.define(version: 20160729182342) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "political_parties", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "politicians", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promise_sources", force: :cascade do |t|
    t.integer  "promise_id", null: false
    t.integer  "source_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promise_id"], name: "index_promise_sources_on_promise_id"
    t.index ["source_id"], name: "index_promise_sources_on_source_id"
  end

  create_table "promise_subjects", force: :cascade do |t|
    t.integer  "category",   null: false
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promises", force: :cascade do |t|
    t.integer  "ruling_party_id", null: false
    t.integer  "subject_id",      null: false
    t.integer  "status",          null: false
    t.string   "title",           null: false
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["ruling_party_id"], name: "index_promises_on_ruling_party_id"
  end

  create_table "ruling_parties", force: :cascade do |t|
    t.integer  "political_party_id"
    t.integer  "leader_id"
    t.integer  "rule_type",          null: false
    t.date     "mandate_start",      null: false
    t.date     "mandate_end"
    t.string   "banner"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["political_party_id"], name: "index_ruling_parties_on_political_party_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string   "media",      null: false
    t.string   "title",      null: false
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
