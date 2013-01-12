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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120111163846) do

  create_table "meters", :force => true do |t|
    t.integer  "dublin_no"
    t.string   "location"
    t.integer  "code"
    t.string   "spaces"
    t.string   "exact_location"
    t.date     "installed"
    t.float    "tariff"
    t.string   "nearest_pad"
    t.string   "op_hours"
    t.boolean  "clearway"
    t.string   "clearway_hours"
    t.string   "comment"
    t.string   "further_info"
    t.boolean  "finished"
    t.string   "extra_comment"
    t.string   "zone"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "niahs", :id => false, :force => true do |t|
    t.integer  "reg_number"
    t.string   "rating"
    t.string   "number"
    t.string   "name"
    t.string   "street1"
    t.string   "street2"
    t.string   "town"
    t.string   "county"
    t.string   "townland"
    t.string   "building_type"
    t.string   "year_from"
    t.string   "year_to"
    t.text     "composition"
    t.text     "appraisal"
    t.string   "web_link"
    t.string   "image_link"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "protected_structures", :force => true do |t|
    t.integer  "rps_number"
    t.string   "structure_name"
    t.text     "description"
    t.string   "street_number"
    t.string   "street_address"
    t.string   "townland"
    t.integer  "niah_ref"
    t.string   "rmp_ref"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "protected_structures", ["slug"], :name => "index_protected_structures_on_slug"

end
