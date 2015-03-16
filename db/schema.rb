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

ActiveRecord::Schema.define(version: 20150311011715) do

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
    t.string   "time_additional_info"
    t.string   "user_motivation"
    t.string   "user_plan"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
