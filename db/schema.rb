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

ActiveRecord::Schema.define(version: 20150315220819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "comment",     null: false
    t.integer  "question_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "question_tags", force: :cascade do |t|
    t.integer  "question_id", null: false
    t.integer  "tag_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_tags", ["question_id"], name: "index_question_tags_on_question_id", using: :btree
  add_index "question_tags", ["tag_id"], name: "index_question_tags_on_tag_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree

  add_foreign_key "answers", "questions"
  add_foreign_key "question_tags", "questions"
  add_foreign_key "question_tags", "tags"
end
