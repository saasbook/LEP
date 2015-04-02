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

ActiveRecord::Schema.define(version: 20150331233002) do

  create_table "groups", force: true do |t|
    t.string   "members"
    t.string   "languages"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pairs", force: true do |t|
    t.string "members"
    t.string "languages"
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
  end

end
