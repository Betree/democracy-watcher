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

ActiveRecord::Schema.define(version: 20160318164221) do

  create_table "campaigns", force: :cascade do |t|
    t.date     "vote_date"
    t.integer  "political_party_id"
    t.integer  "leader_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "campaigns", ["political_party_id"], name: "index_campaigns_on_political_party_id"

  create_table "political_parties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "politicians", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promise_sources", force: :cascade do |t|
    t.integer  "promise_id"
    t.string   "media"
    t.string   "title"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "promise_sources", ["promise_id"], name: "index_promise_sources_on_promise_id"

  create_table "promise_status_sources", force: :cascade do |t|
    t.integer  "promise_status_id"
    t.string   "media"
    t.string   "title"
    t.string   "url"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "promise_status_sources", ["promise_status_id"], name: "index_promise_status_sources_on_promise_status_id"

  create_table "promise_statuses", force: :cascade do |t|
    t.integer  "promise_id"
    t.string   "title"
    t.string   "details"
    t.date     "date_start"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "promise_statuses", ["promise_id"], name: "index_promise_statuses_on_promise_id"

  create_table "promises", force: :cascade do |t|
    t.integer  "campaign_id"
    t.integer  "category"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "promises", ["campaign_id"], name: "index_promises_on_campaign_id"

  create_table "ruling_parties", force: :cascade do |t|
    t.integer  "campaign_id"
    t.date     "mandate_start"
    t.date     "mandate_end"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "ruling_parties", ["campaign_id"], name: "index_ruling_parties_on_campaign_id"

end
