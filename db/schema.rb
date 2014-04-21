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

ActiveRecord::Schema.define(version: 20140421184446) do

  create_table "challenge_winners", force: true do |t|
    t.integer  "challenge_id"
    t.integer  "submission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenges", force: true do |t|
    t.string  "month"
    t.string  "league"
    t.integer "year"
    t.string  "title"
    t.string  "winner"
  end

  create_table "comments", force: true do |t|
    t.string   "name"
    t.string   "comment"
    t.string   "month"
    t.string   "league"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "reply_id"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "current_month_years", force: true do |t|
    t.string   "month"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "submission_code"
    t.string   "month"
    t.string   "league"
    t.integer  "year"
    t.string   "visible"
    t.integer  "challenge_id"
    t.boolean  "complete"
  end

  create_table "surveys", force: true do |t|
    t.string   "haveParticipated"
    t.string   "whyStart"
    t.string   "newSkills"
    t.string   "howUsedSkills"
    t.string   "betterServe"
    t.string   "whyNot"
    t.string   "bestLeague"
    t.string   "automation"
    t.string   "otherDevelopment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "whatWouldInterest"
    t.string   "whatWouldIncreaseParticipation"
    t.string   "skillsExample"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin"
    t.string   "photo"
    t.string   "email"
    t.string   "su"
  end

end
