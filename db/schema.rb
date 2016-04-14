# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160317003806) do

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
  end

  add_index "promises", ["ruling_party_id"], name: "index_promises_on_ruling_party_id"

  create_table "ruling_parties", force: :cascade do |t|
    t.integer  "political_party_id"
    t.integer  "leader_id"
    t.integer  "rule_type",          null: false
    t.date     "mandate_start",      null: false
    t.date     "mandate_end"
    t.string   "banner"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "ruling_parties", ["political_party_id"], name: "index_ruling_parties_on_political_party_id"

  create_table "sources", force: :cascade do |t|
    t.integer  "promise_id"
    t.integer  "source_type", null: false
    t.string   "media",       null: false
    t.string   "title",       null: false
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sources", ["promise_id"], name: "index_sources_on_promise_id"

end
