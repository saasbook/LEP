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

ActiveRecord::Schema.define(version: 20150415225609) do

  create_table "groups", force: true do |t|
    t.string   "members"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time"
    t.string   "location"
    t.string   "language"
    t.string   "day"
    t.string   "info"
    t.integer  "facilitator"
  end

  create_table "pairs", force: true do |t|
    t.string   "member1"
    t.string   "member2"
    t.string   "member3"
    t.string   "languages"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "sid"
    t.string   "email"
    t.string   "academic_title"
    t.string   "major"
    t.string   "residency"
    t.string   "gender"
    t.string   "gender_preference"
    t.string   "fluent_languages"
    t.string   "lang_additional_info"
    t.string   "first_lang_preference"
    t.string   "first_lang_proficiency"
    t.string   "second_lang_preference"
    t.string   "second_lang_proficiency"
    t.string   "time_preference"
    t.string   "hours_per_week"
    t.string   "user_motivation"
    t.string   "user_plan"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                   default: false
    t.boolean  "active"
    t.string   "group_leader"
    t.string   "group_language"
    t.boolean  "facilitator"
    t.string   "fluent_languages_other"
  end

end
