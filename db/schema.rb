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

ActiveRecord::Schema.define(:version => 20111229124642) do

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

end
