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

ActiveRecord::Schema.define(version: 20150104133942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "perspectives", force: :cascade do |t|
    t.string   "name",                                    null: false
    t.text     "description",                             null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "type",                                    null: false
    t.integer  "show_items",              default: 1
    t.boolean  "show_folders_in_outline", default: false, null: false
    t.integer  "sort_items_by"
    t.boolean  "shown_in_sidebar",        default: false, null: false
    t.integer  "show_projects"
    t.integer  "sort_projects_by"
    t.integer  "group_projects_by"
    t.boolean  "open_in_a_new_window",    default: false, null: false
    t.integer  "filter_by_status"
    t.integer  "filter_by_availability"
    t.integer  "filter_by_duration"
    t.integer  "filter_projects"
    t.string   "find_text"
    t.integer  "group_items_by"
    t.integer  "filter_contexts"
  end

end
