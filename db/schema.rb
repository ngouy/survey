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

ActiveRecord::Schema.define(version: 20170918034322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "answers", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "question_id",      null: false
    t.uuid     "next_question_id"
    t.string   "text",             null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["text", "question_id"], name: "index_answers_on_text_and_question_id", unique: true, using: :btree
  end

  create_table "choices", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "feedback_id", null: false
    t.uuid     "answer_id",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["feedback_id", "answer_id"], name: "index_choices_on_feedback_id_and_answer_id", unique: true, using: :btree
  end

  create_table "feedbacks", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "survey_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "survey_id",  null: false
    t.string   "text",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id", "text"], name: "index_questions_on_survey_id_and_text", unique: true, using: :btree
  end

  create_table "surveys", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.text     "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_surveys_on_name", unique: true, using: :btree
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "questions", column: "next_question_id"
  add_foreign_key "choices", "answers"
  add_foreign_key "choices", "feedbacks"
  add_foreign_key "feedbacks", "surveys"
  add_foreign_key "questions", "surveys"
end
